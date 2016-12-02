# This class provides a parent class that allows for simple specification of subclasses for handling specific
# fixed length record formats. Fixed length records specify the offset and length of each field. For example,
# the following data might represent an employee number, favorite color, and hire year:
#
#   3121orange  2013
#   0212blue    2001
#   4461green   2014
#
# An example class for parsing or writing this data would look like
#
#   class EmployeeFormat < FixedLengthRecordFormat
#     range 0..3, :employee_number
#     range 4..11, :favorite_color
#     range 12..15, :hire_year
#   end
#
# This class could then be used as follows:
#
#   EmployeeFormat.read(data) do |record|
#     puts "#{record.employee_number}: #{record.favorite_color}"
#   end
#
#   records = [
#     EmployeeFormat.new(employee_number: 33, favorite_color: 'purple', hire_year: 1901)
#     EmployeeFormat.new(employee_number: 2211, favorite_color: 'pink', hire_year: 2008)
#   ]
#   formatted_output = EmployeeFormat.write(records)

module IJE

  class FixedLengthRecordFormat

    # Macro-like method for creating a range on a sub class; checks for issues with overlapping names or ranges,
    # stores the range info, and make appropriate getters and setters available on instances
    def self.range(range, name)
      @ranges ||= {}
      raise "Duplicate range #{name} specified" if @ranges[name]
      if @ranges.values.any? { |existing| existing.cover?(range.first) || range.cover?(existing.first) }
        raise "Overlapping range #{name} specified"
      end
      @ranges[name] = range
      attr_accessor name
    end

    # Reader method that takes formatted data and yields records
    def self.read(data)
      data.each_line do |line|
        record = self.new
        @ranges.each do |name, range|
          # TODO make this faster with Array#unpack
          record.send("#{name}=", line.slice(range).strip)
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
          # TODO make this faster with Array#pack
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
