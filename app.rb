require 'csv'
require_relative 'random_letters'
require_relative 'age_identifier'


areas = []
codes = []
# Counting Registration Numbers
invalid_count = 0
birmingham_area_codes_amount = 0
swansea_area_codes_amount = 0
cardiff_area_codes_amount = 0

# programmatically delete all irrelevant data from the csv
CSV.foreach('vehicles.csv', headers: true) do |row|
  row.delete('vin')
  row.delete('make')
  row.delete('colour')

  areas << row.to_h
end

# re-assign the value each time
areas.each do |area|
  case area['registrationArea']
  when 'birmingham'
    codes << "B#{+ %w[A B C].sample} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
    birmingham_area_codes_amount += 1
  when 'swansea'
    codes << "C#{+ RandomLetters.generate_second_letter(swansea: true)} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
    swansea_area_codes_amount += 1
  when 'cardiff'
    codes << "C#{+ RandomLetters.generate_second_letter(swansea: false)} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
    cardiff_area_codes_amount += 1
  else
    invalid_count += 1
  end
end

# One flat array of all codes to perform operations on
codes = codes.flatten

puts "\nRegistration Numbers Created: #{codes.count}"
puts "\nRegistration Numbers Not Created: #{invalid_count}"

puts "\nRegistration Numbers Created in Birmingham #{birmingham_area_codes_amount}"
puts "\nRegistration Numbers Created in Swansea #{swansea_area_codes_amount}"
puts "\nRegistration Numbers Created in Cardiff #{cardiff_area_codes_amount}"


# output file for results
file = File.open('reg_codes.csv', 'w')
file.write("\n#{codes}")
file.close

