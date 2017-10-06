require_relative 'fixed_length_record_format'

module IJE

  class MortalityFormat < IJE::FixedLengthRecordFormat
    range 0..3,     :date_of_death_year,                 type: :year
    range 4..5,     :state_territory_province_code,      type: :state
    range 6..11,    :certificate_number,                 type: :rjust_zeroes
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
    range 190..198, :social_security_number,             type: :ssn
    range 199..199, :decedents_age_type
    range 200..202, :decedents_age_units
    range 203..203, :decedents_age_edit_flag
    range 204..207, :date_of_birth_year
    range 208..209, :date_of_birth_month
    range 210..211, :date_of_birth_day
    range 212..213, :birthplace_country
    range 214..215, :state_us_territory_or_canadian_province_of_birth_code
    range 216..220, :decedents_residence_city
    range 221..223, :decedents_residence_county
    range 224..225, :state_us_territory_or_canadian_province_of_decedents_residence_code
    range 226..227, :decedents_residence_country
    range 228..228, :decedents_residence_inside_city_limits
    range 229..229, :marital_status
    range 230..230, :marital_status_edit_flag
    range 231..231, :place_of_death
    range 232..234, :county_of_death_occurrence
    range 235..235, :method_of_disposition
    range 236..237, :date_of_death_month
    range 238..239, :date_of_death_day
    range 240..243, :time_of_death
    range 244..244, :decedents_education
    range 245..245, :decedents_education_edit_flag
    range 246..246, :decedent_of_hispanic_origin_mexican
    range 247..247, :decedent_of_hispanic_origin_puerto_rican
    range 248..248, :decedent_of_hispanic_origin_cuban
    range 249..249, :decedent_of_hispanic_origin_other
    range 250..269, :decedent_of_hispanic_origin_other_literal
    range 270..270, :decedents_race_white
    range 271..271, :decedents_race_black_or_african_american
    range 272..272, :decedents_race_american_indian_or_alaska_native
    range 273..273, :decedents_race_asian_indian
    range 274..274, :decedents_race_chinese
    range 275..275, :decedents_race_filipino
    range 276..276, :decedents_race_japanese
    range 277..277, :decedents_race_korean
    range 278..278, :decedents_race_vietnamese
    range 279..279, :decedents_race_other_asian
    range 280..280, :decedents_race_native_hawaiian
    range 281..281, :decedents_race_guamanian_or_chamorro
    range 282..282, :decedents_race_samoan
    range 283..283, :decedents_race_other_pacific_islander
    range 284..284, :decedents_race_other
    range 285..314, :decedents_race_first_american_indian_or_alaska_native_literal
    range 315..344, :decedents_race_second_american_indian_or_alaska_native_literal
    range 345..374, :decedents_race_first_other_asian_literal
    range 375..404, :decedents_race_second_other_asian_literal
    range 405..434, :decedents_race_first_other_pacific_islander_literal
    range 435..464, :decedents_race_second_other_pacific_islander_literal
    range 465..494, :decedents_race_first_other_literal
    range 495..524, :decedents_race_second_other_literal
    range 525..527, :race_tabulation_variables
    range 528..530, :race_tabulation_variables_second
    range 531..533, :race_tabulation_variables_third
    range 534..536, :race_tabulation_variables_fourth
    range 537..539, :race_tabulation_variables_fifth
    range 540..542, :race_tabulation_variables_sixth
    range 543..545, :race_tabulation_variables_seventh
    range 546..548, :race_tabulation_variables_eighth
    range 549..551, :race_tabulation_variables_ninth
    range 552..554, :race_tabulation_variables_tenth
    range 555..557, :race_tabulation_variables_eleventh
    range 558..560, :race_tabulation_variables_twelvth
    range 561..563, :race_tabulation_variables_thirteenth
    range 564..566, :race_tabulation_variables_fourteenth
    range 567..569, :race_tabulation_variables_fifteenth
    range 570..572, :race_tabulation_variables_sixteenth
    range 573..573, :decedents_race_missing
    range 574..613, :occupation_literal_optional
    range 614..616, :occupation_code_optional
    range 617..656, :industry_literal_optional
    range 657..659, :industry_code_optional
    range 660..665, :infant_death_birth_linking_birth_certificate_number
    range 666..669, :infant_death_birth_linking_year_of_birth
    range 670..671, :infant_death_birth_linking_state_us_territory_or_canadian_province_of_birth_code
    range 672..675, :receipt_date_year
    range 676..677, :receipt_date_month
    range 678..679, :receipt_date_day
    range 680..687, :filler_1_for_expansion
    range 688..691, :date_of_registration_year
    range 692..693, :date_of_registration_month
    range 694..695, :date_of_registration_day
    range 696..699, :filler_2_for_expansion
    range 700..700, :manner_of_death
    range 701..701, :intentional_reject_
    range 702..702, :acme_system_reject_codes
    range 703..703, :place_of_injury_computer_generated
    range 704..708, :manual_underlying_cause_
    range 709..713, :acme_underlying_cause
    range 714..873, :entity_axis_codes
    range 874..874, :transax_conversion_flag_computer_generated
    range 875..974, :record_axis_codes
    range 975..975, :was_autopsy_performed
    range 976..976, :were_autopsy_findings_available_to_complete_the_cause_of_death
    range 977..977, :did_tobacco_use_contribute_to_death
    range 978..978, :pregnancy
    range 979..979, :if_female_edit_flag_from_edr_only
    range 980..981, :date_of_injury_month
    range 982..983, :date_of_injury_day
    range 984..987, :date_of_injury_year
    range 988..991, :time_of_injury
    range 992..992, :injury_at_work
    range 993..1022, :title_of_certifier
    range 1023..1023, :activity_at_time_of_death_computer_generated
    range 1024..1035, :auxiliary_state_file_number_second
    range 1036..1065, :state_specific_data_
    range 1066..1067, :surgery_date_month
    range 1068..1069, :surgery_date_day
    range 1070..1073, :surgery_date_year
    range 1074..1074, :time_of_injury_unit
    range 1075..1079, :for_possible_future_change_in_transax
    range 1080..1080, :decedent_ever_served_in_armed_forces
    range 1081..1110, :death_institution_name
    range 1111..1160, :long_string_address_for_place_of_death
    range 1161..1170, :place_of_death_street_number
    range 1171..1180, :place_of_death_pre_directional
    range 1181..1230, :place_of_death_street_name
    range 1231..1240, :place_of_death_street_designator
    range 1241..1250, :place_of_death_post_directional
    range 1251..1278, :place_of_death_city_or_town_name
    range 1279..1306, :place_of_death_state_name_literal
    range 1307..1315, :place_of_death_zip_code
    range 1316..1343, :place_of_death_county_of_death
    range 1344..1348, :place_of_death_city_fips_code
    range 1349..1365, :place_of_death_longitude
    range 1366..1382, :place_of_death_latitude
    range 1383..1383, :decedents_spouse_living_at_decedents_dod
    range 1384..1433, :spouses_first_name
    range 1434..1483, :husbands_surname_wifes_maiden_last_name
    range 1484..1493, :decedents_residence_street_number
    range 1494..1503, :decedents_residence_pre_directional
    range 1504..1531, :decedents_residence_street_name
    range 1532..1541, :decedents_residence_street_designator
    range 1542..1551, :decedents_residence_post_directional
    range 1552..1558, :decedents_residence_unit_or_apt_number
    range 1559..1586, :decedents_residence_city_or_town_name
    range 1587..1595, :decedents_residence_zip_code
    range 1596..1623, :decedents_residence_county_second
    range 1624..1651, :decedents_residence_state_name
    range 1652..1679, :decedents_residence_country_name
    range 1680..1729, :long_string_address_for_decedents_place_of_residence_
    range 1730..1731, :old_nchs_residence_state_code
    range 1732..1734, :old_nchs_residence_city_county_combo_code
    range 1735..1737, :hispanic_nchs_will_send_this_information_to_occurrence_state
    range 1738..1739, :race_this_item_will_be_returned_to_occurrence_state
    range 1740..1740, :hispanic_old_nchs_single_ethnicity_codes
    range 1741..1741, :race_old_nchs_single_race_codes
    range 1742..1756, :hispanic_origin_specify
    range 1757..1806, :race_specify
    range 1807..1856, :middle_name_of_decedent
    range 1857..1906, :fathers_first_name
    range 1907..1956, :fathers_middle_name
    range 1957..2006, :mothers_first_name
    range 2007..2056, :mothers_middle_name
    range 2057..2106, :mothers_maiden_surname
    range 2107..2107, :was_case_referred_to_medical_examiner_coroner
    range 2108..2157, :place_of_injury_literal
    range 2158..2407, :describe_how_injury_occurred
    range 2408..2437, :if_transportation_accident_specify
    range 2438..2465, :county_of_injury_literal
    range 2466..2468, :county_of_injury_code
    range 2469..2496, :town_city_of_injury_literal
    range 2497..2501, :town_city_of_injury_code
    range 2502..2503, :state_us_territory_or_canadian_province_of_injury_code
    range 2504..2520, :place_of_injury_longitude
    range 2521..2537, :place_of_injury_latitude
    range 2538..2539, :old_nchs_education_code
    range 2540..2540, :replacement_record___suggested_codes
    range 2541..2660, :cause_of_death_part_i_line_a
    range 2661..2680, :cause_of_death_part_i_interval_line_a
    range 2681..2800, :cause_of_death_part_i_line_b
    range 2801..2820, :cause_of_death_part_i_interval_line_b
    range 2821..2940, :cause_of_death_part_i_line_c
    range 2941..2960, :cause_of_death_part_i_interval_line_c
    range 2961..3080, :cause_of_death_part_i_line_d
    range 3081..3100, :cause_of_death_part_i_interval_line_d
    range 3101..3340, :cause_of_death_part_ii
    range 3341..3390, :decedents_maiden_name
    range 3391..3395, :decedents_birth_place_city___code
    range 3396..3423, :decedents_birth_place_city___literal
    range 3424..3473, :spouses_middle_name
    range 3474..3483, :spouses_suffix
    range 3484..3493, :fathers_suffix
    range 3494..3503, :mothers_suffix
    range 3504..3533, :informants_relationship
    range 3534..3535, :state_us_territory_or_canadian_province_of_disposition_code
    range 3536..3563, :disposition_state_or_territory_literal
    range 3564..3568, :disposition_city_code
    range 3569..3596, :disposition_city_literal
    range 3597..3696, :funeral_facility_name
    range 3697..3706, :funeral_facility_street_number
    range 3707..3716, :funeral_facility_pre_directional
    range 3717..3744, :funeral_facility_street_name
    range 3745..3754, :funeral_facility_street_designator
    range 3755..3764, :funeral_facility_post_directional
    range 3765..3771, :funeral_facility_unit_or_apt_number
    range 3772..3821, :long_string_address_for_funeral_facility
    range 3822..3849, :funeral_facility_city_or_town_name
    range 3850..3851, :state_us_territory_or_canadian_province_of_funeral_facility_code
    range 3852..3879, :state_us_territory_or_canadian_province_of_funeral_facility_literal
    range 3880..3888, :funeral_facility_zip
    range 3889..3896, :person_pronouncing_date_signed
    range 3897..3900, :person_pronouncing_time_pronounced
    range 3901..3950, :certifiers_first_name
    range 3951..4000, :certifiers_middle_name
    range 4001..4050, :certifiers_last_name
    range 4051..4060, :certifiers_suffix_name
    range 4061..4070, :certifier_street_number
    range 4071..4080, :certifier_pre_directional
    range 4081..4108, :certifier_street_name
    range 4109..4118, :certifier_street_designator
    range 4119..4128, :certifier_post_directional
    range 4129..4135, :certifier_unit_or_apt_number
    range 4136..4185, :long_string_address_for_certifier
    range 4186..4213, :certifier_city_or_town_name
    range 4214..4215, :state_us_territory_or_canadian_province_of_certifier_code
    range 4216..4243, :state_us_territory_or_canadian_province_of_certifier_literal
    range 4244..4252, :certifier_zip
    range 4253..4260, :certifier_date_signed
    range 4261..4268, :date_filed
    range 4269..4296, :state_us_territory_or_canadian_province_of_injury_literal
    range 4297..4324, :state_us_territory_or_canadian_province_of_birth_literal
    range 4325..4326, :country_of_death_code
    range 4327..4354, :country_of_death_literal
    range 4355..4357, :ssa_state_source_of_death
    range 4358..4358, :ssa_foreign_country_indicator
    range 4359..4359, :ssa_edr_verify_code
    range 4360..4367, :ssa_date_of_ssn_verification
    range 4368..4375, :ssa_date_of_state_transmission
    range 4376..4425, :marital_descriptor
    range 4426..4428, :hispanic_code_for_literal
    range 4429..4728, :blank_for_future_expansion
    range 4729..4999, :blank_for_jurisdictional_use_only

    # Error exception and type support functions for mortality fields; each function validates and formats
    # data of a particular type, as appropriate; each type can have a function for each direction (converting
    # from fixed length format to record format and the reverse)

    class MortalityFormatError < StandardError ; end

    def year_input(field_name, field_value, field_length)
      raise MortalityFormatError, "Non-numeric value provided for #{field_name}" unless field_value.to_s.match(/[0-9]{4}/)
      raise MortalityFormatError, "Incorrect field length provided for #{field_name}" unless field_value.to_s.length == field_length
      field_value
    end

    def state_input(field_name, field_value, field_length)
      raise MortalityFormatError, "Non-letter value provided for #{field_name}" unless field_value.to_s.match(/[A-Z]{2}/)
      field_value
    end

    def rjust_zeroes_input(field_name, field_value, field_length)
      raise MortalityFormatError, "Non-numeric value provided for #{field_name}" unless field_value.to_s.match(/[0-9]+/)
      raise MortalityFormatError, "Field length too large for #{field_name}" unless field_value.to_s.length <= field_length
      "%0#{field_length}d" % field_value
    end

    def rjust_zeroes_output(field_name, field_value, field_length)
      # Remove all zeroes from left
      field_value.to_s.gsub(/^0+/, '')
    end

    def ssn_input(field_name, field_value, field_length)
      raise MortalityFormatError, "Non-numeric value provided for #{field_name}" unless field_value.to_s.match(/[0-9]{9}/)
      raise MortalityFormatError, "Field length incorrect for #{field_name}" unless field_value.to_s.length == field_length
      field_value
    end

  end

end
