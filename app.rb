require 'csv'
require_relative 'random_letters'
require_relative 'age_identifier'


areas = []
codes = []
count = 0
cities = []

# programmatically delete all irrelevant data from the csv
CSV.foreach('vehicles.csv', headers: true) do |row|
  # CSV.foreach('vehicles.csv', headers: true) do |row|
  row.delete('vin')
  row.delete('make')
  row.delete('colour')

  areas << row.to_h
  cities << row['registrationArea']
end

# re-assign the value each time
areas.each do |area|
  case area['registrationArea']
  when 'birmingham'
    codes << "B#{+ %w[A B C].sample} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
  when 'swansea'
    codes << "C#{+ RandomLetters.generate_second_letter(swansea: true)} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
  when 'cardiff'
    codes << "C#{+ RandomLetters.generate_second_letter(swansea: false)} #{AgeIdentifier.extract_year(area['dateOfManufacture'])} #{RandomLetters.generate}"
  else
    count += 1
  end
end

codes = codes.flatten

puts "\n\nValid Reg Numbers: #{codes.count}"
puts "\n\nInvalid Data: #{count}"

# need to use to count reg's per city
# puts "\n\nRegistration Areas: #{cities}"

# output file for results
file = File.open('reg_codes.csv', 'w')
file.write("\n#{codes}")
file.close