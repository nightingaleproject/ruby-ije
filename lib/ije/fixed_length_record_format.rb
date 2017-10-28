# This class provides a parent class that allows for simple specification of subclasses for handling specific
# fixed length record formats. Fixed length records specify the offset and length of each field, along with
# optional type validators for those fields. For example, the following data might represent an employee
# number, favorite color, and hire year:
#
#   3121orange  2013
#   0212blue    2001
#   4461green   2014
#
# An example class for parsing or writing this data would look like
#
#   class EmployeeFormat < IJE::FixedLengthRecordFormat
#     range 0..3, :employee_number, type: :numeric
#     range 4..11, :favorite_color
#     range 12..15, :hire_year, type: :numeric
#     def numeric_input(field_name, field_value, field_length)
#       raise StandardError, "Non-numeric data provided for #{field_name}" unless field_value.is_a?(Integer)
#       field_value
#     end
#     def numeric_output(field_name, field_value, field_length)
#       field_value.to_i
#     end
#   end
#
# This class could then be used as follows:
#
#   records = [
#              EmployeeFormat.new(employee_number: 33, favorite_color: 'purple', hire_year: 1901),
#              EmployeeFormat.new(employee_number: 2211, favorite_color: 'pink', hire_year: 2008)
#             ]
#   formatted_output = EmployeeFormat.write(records)
#
#   EmployeeFormat.read(formatted_output) do |record|
#     puts "#{record.employee_number}: #{record.favorite_color}"
#   end

module IJE

  class FixedLengthRecordFormat

    # Macro-like method for creating a range on a sub class; checks for issues with overlapping names or ranges,
    # stores the range info, and make appropriate getters and setters available on instances, which call an
    # optionally supplied type function for validation and formatting
    def self.range(range, name, options={})
      @ranges ||= {}
      raise "Duplicate range #{name} specified" if @ranges[name]
      if @ranges.values.any? { |existing| existing.cover?(range.first) || range.cover?(existing.first) }
        raise "Overlapping range #{name} specified"
      end
      @ranges[name] = range

      # Store any provided type option for later use in calling the appropriate validator/formatter
      @types ||= {}
      @types[name] = options[:type]

      # Create getters and setters; we create the setter programmatically so that any specified type
      # validation/formatting functions can be called; the matching validator/formatter for reading from the
      # fixed length format is called during the read method below
      attr_reader name
      define_method "#{name}=" do |value|
        # The base name of any type validation/formatting function is specified in the :type option; we only
        # call it if it's defined and if there's a value to check, because we want to allow for unknown data
        if options[:type] && respond_to?("#{options[:type]}_input") && value.to_s.length > 0
          # Type formatting functions receive the field name, value, and length
          value = self.send("#{options[:type]}_input", name, value, range.size)
        end
        instance_variable_set("@#{name}", value)
      end

    end

    # Reader method that takes formatted data and yields records
    def self.read(data)
      data.each_line do |line|
        record = self.new
        @ranges.each do |name, range|
          # Take into account cases where the length of the line is smaller than the expressed range.
          value = if range.first <= line.length - 1
                    if range.last <= line.length - 1
                      line.slice(range).strip
                    else
                      line.slice(range.first..-1).strip
                    end
                  end
          #  Call the type validation function for this field it if it exists and there's is a value to check (we
          #  want to allow for unknown data)
          if @types[name] && record.respond_to?("#{@types[name]}_output") && value.to_s.length > 0
            # Type formatting functions receive the field name, value, and length
            value = record.send("#{@types[name]}_output", name, value, range.size)
          end
          record.send("#{name}=", value)
        end
        yield record
      end
    end

    # Writer method that takes records and returns formatted data
    def self.write(records)
      records.each_with_object("") do |record, output|
        line = ""
        @ranges.sort_by { |name, range| range.first }.each do |name, range|
          value = record.send(name).to_s
          raise "Data to large for field #{name}" if value.length > range.size
          line[range] = value.ljust(range.size) # Pad on the right side with spaces
        end
        output << line << "\n"
      end
    end

    # Allow instances to be initialized with initial values
    def initialize(initial_values = {})
      initial_values.each do |name, value|
        self.send("#{name}=", value)
      end
    end

  end

end
