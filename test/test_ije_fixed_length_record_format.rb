require 'minitest/autorun'
require 'ije/fixed_length_record_format'

class EmployeeFormat < IJE::FixedLengthRecordFormat
  range 0..3, :employee_number, type: :numeric
  range 4..11, :favorite_color
  range 12..15, :hire_year, type: :numeric
  def numeric_input(field_name, field_value, field_length)
    raise StandardError, "Non-numeric data provided for #{field_name}" unless field_value.is_a?(Integer)
    field_value
  end
  def numeric_output(field_name, field_value, field_length)
    field_value.to_i
  end
end

class FixedLengthRecordFormatTest < Minitest::Test

  def test_round_trip
    original_records = [
               EmployeeFormat.new(employee_number: 33, favorite_color: 'purple', hire_year: 1901),
               EmployeeFormat.new(employee_number: 2211, favorite_color: 'pink', hire_year: 2008)
              ]
    formatted_output = EmployeeFormat.write(original_records)

    new_records = []
    EmployeeFormat.read(formatted_output) do |new_record|
      new_records << new_record
    end

    original_records.zip(new_records).each do |original_record, new_record|
      assert_equal(original_record.employee_number, new_record.employee_number)
      assert_equal(original_record.favorite_color, new_record.favorite_color)
      assert_equal(original_record.hire_year, new_record.hire_year)
    end
  end

end
