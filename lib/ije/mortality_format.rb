require_relative 'fixed_length_record_format'

# TODO: probably need a formatting specification, ie left 0 filled, etc
# TODO: might want a type specification, ie integer, boolean
# TODO: might want to include validators for legal ranges/values

module IJE

  class MortalityFormat < IJE::FixedLengthRecordFormat
    range 0..3,     :date_of_death_year
    range 4..5,     :state_territory_province_code
    range 6..11,    :certificate_number
    range 12..12,   :void_flag
    range 13..24,   :auxiliary_state_file_number
    range 25..25,   :source_flag
    range 26..75,   :decedant_legal_name_given
    range 76..76,   :decedant_legal_name_middle
    range 77..126,  :decedant_legal_name_last
    range 127..136, :decedant_legal_name_suffix
    range 137..137, :decedant_legal_name_alias
    range 138..187, :father_surname
    range 188..188, :sex
    range 189..189, :sex_edit_flag
    range 190..198, :social_security_number
  end

end
