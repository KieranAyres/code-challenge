require 'csv'
require_relative 'random_three_letters'

def generate_second_letter(swansea: false)
  if swansea
    ('A'..'K').to_a.sample
  else
    ('L'..'Z').to_a.sample
  end
end

# can I just put my logic in these iteration methods here load in here to create my reg numbers
areas = []
codes = []
count = 0
cities = []

# programmatically delete all irrelevant data from the csv
CSV.foreach('new_vehicles.csv', headers: true) do |row|
  # CSV.foreach('vehicles.csv', headers: true) do |row|
  row.delete('vin')
  row.delete('make')
  row.delete('colour')
  row.delete('dateOfManufacture')

  areas << row.to_h
  cities << row['registrationArea']
end

# re-assign the value each time
areas.each do |area|
  case area['registrationArea']
  when 'birmingham'
    codes << "B#{+ %w[A B C].sample} #{RandomLetters.generate}"
  when 'swansea'
    codes << "C#{+ generate_second_letter(swansea: true)} #{RandomLetters.generate}"
  when 'cardiff'
    codes << "C#{+ generate_second_letter(swansea: false)} #{RandomLetters.generate}"
  else
    count += 1
  end
end

# All Codes
codes = codes.flatten

puts "Reg Numbers: #{codes}"
puts "\n\nValid Reg Numbers: #{codes.count}"
puts "\n\nInvalid Data: #{count}"
puts "\n\nRegistration Areas: #{cities}"

# File.open('reg_codes.csv', 'w').write(codes)

# def compose_vrns
#
# end

def reg_numbers_generated(reg_numbers)
  puts "Total number of registration numbers: #{reg_numbers.count}"
end

# roughly requirement number 3
# refactor this to take in a list of values to do this against so it doesn't read in a csv
def count_invalid_reg_numbers
  full_table = CSV.read('vehicles.csv', headers: true)
  count = 0
  full_table['registrationArea'].each do |area|
    if AreaCodes::VALID_AREA_CODES.include?(area)
      'valid'
    else
      count +=1
    end
  end
  "Number of registration numbers not created: #{count}"
end

