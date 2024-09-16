require 'csv'

def generate_second_letter(swansea: false)
  if swansea
    ('A'..'K').to_a.sample
  else
    ('L'..'Z').to_a.sample
  end
end

# can I just put my logic in these iteration methods here load in here to create my reg numbers
areas = []

# CSV.foreach('new_vehicles.csv', headers: true) do |row|
CSV.foreach('vehicles.csv', headers: true) do |row|
  row.delete('vin')
  row.delete('make')
  row.delete('colour')
  row.delete('dateOfManufacture')

  areas << row.to_h
end

# hash of each reg area - registrationArea: area
# puts areas[0]['registrationArea']

codes = []
birmingham_area_codes = []
swansea_area_codes = []
cardiff_area_codes = []
count = 0

areas.each do |area|
  case area['registrationArea']
  when 'birmingham'
    birmingham_area_codes << 'B' + %w[A B C].sample
  when 'swansea'
    swansea_area_codes << 'C' + generate_second_letter(swansea: true)
  when 'cardiff'
    cardiff_area_codes << 'C' + generate_second_letter(swansea: false)
  else
    count += 1
  end
  codes = [birmingham_area_codes, swansea_area_codes, cardiff_area_codes]
end

# All Codes
codes = codes.flatten

puts "Reg Numbers: #{codes}"
puts "\nInvalid Data: #{count}".
File.open('reg_codes.csv', 'w').write(codes)
# puts area_codes