# README

This library supports reading and writing IJE formatted data. To use it for producing IJE formatted data:

```ruby
record = IJE::MortalityFormat.new(date_of_death_year: 2010,
                                  state_territory_province_code: "NY",
                                  certificate_number: "000021",
                                  void_flag: 0,
                                  source_flag: 0,
                                  decedant_legal_name_given: "Nobody123",
                                  decedant_legal_name_middle: "X",
                                  decedant_legal_name_last: "Nothing321",
                                  sex: 'U',
                                  social_security_number: '111111111')

ije_output = IJE::MortalityFormat.write([record]) # Takes an array of records
```

To read IJE formatted data:

```ruby
IJE::MortalityFormat.read(ije_data) { |record| puts record.social_security_number }
```
