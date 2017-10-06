require 'minitest/autorun'
require 'ije/mortality_format'

class MortalityFormatTest < Minitest::Test

  def setup
    @record1 = IJE::MortalityFormat.new(date_of_death_year: 2010,
                                        state_territory_province_code: "NY",
                                        certificate_number: "21",
                                        void_flag: 0,
                                        source_flag: 0,
                                        decedant_legal_name_given: "Nobody123",
                                        decedant_legal_name_middle: "X",
                                        decedant_legal_name_last: "Nothing321",
                                        sex: 'U',
                                        social_security_number: '111111111')

    @record2 = IJE::MortalityFormat.new(date_of_death_year: 2011,
                                        state_territory_province_code: "NY",
                                        certificate_number: "22",
                                        void_flag: 0,
                                        source_flag: 0,
                                        decedant_legal_name_given: "Xyz123",
                                        decedant_legal_name_middle: "X",
                                        decedant_legal_name_last: "Zyx321",
                                        sex: 'U',
                                        social_security_number: '222222222')

    @output = "2010NY0000210            0Nobody123                                         XNothing321                                                                                                     U 111111111\n"
    @output << "2011NY0000220            0Xyz123                                            XZyx321                                                                                                         U 222222222\n"
  end

  def test_read
    records = []
    IJE::MortalityFormat.read(@output) { |record| records << record }
    assert_equal 2, records.size
    assert_equal '2010', records[0].date_of_death_year
    assert_equal '2011', records[1].date_of_death_year
    assert_equal 'Nobody123', records[0].decedant_legal_name_given
    assert_equal 'Xyz123', records[1].decedant_legal_name_given
    assert_equal '111111111', records[0].social_security_number
    assert_equal '222222222', records[1].social_security_number
  end

  def test_write
    output = IJE::MortalityFormat.write([@record1, @record2])
    lines = output.split("\n")
    assert_equal 2, lines.size
    assert_equal '2010', lines[0][0,4]
    assert_equal '2011', lines[1][0,4]
    assert_equal 'Nobody123', lines[0][26,9]
    assert_equal 'Xyz123', lines[1][26,6]
    assert_equal '111111111', lines[0][190,9]
    assert_equal '222222222', lines[1][190,9]
  end

  def test_round_trip
    output1 = IJE::MortalityFormat.write([@record1, @record2])
    records1 = []
    IJE::MortalityFormat.read(output1) { |record| records1 << record }
    output2 = IJE::MortalityFormat.write(records1)
    assert_equal(output1, output2)
  end

  def test_write_formatting_errors
    assert_raises IJE::MortalityFormat::MortalityFormatError do
      IJE::MortalityFormat.new(date_of_death_year: "not a year")
    end
    assert_raises IJE::MortalityFormat::MortalityFormatError do
      IJE::MortalityFormat.new(date_of_death_year: "1999999999")
    end
  end

end
