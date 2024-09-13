require 'csv'

# read in the vehicles file
# table = CSV.parse(File.read("vehicles.csv"), headers: true)



# colour
# table = CSV.foreach('vehicles.csv') { |line| puts line[1] }
# # vin
# table = CSV.foreach('vehicles.csv') { |line| puts line[3] }


# make
# table = CSV.foreach('vehicles.csv') { |line| puts line[0] }
# # date of manufacture
# table = CSV.foreach('vehicles.csv') { |line| puts line[2] }

def generate_second_letter(swansea: false)
  if swansea
    ('A'..'K').to_a.sample
  else
    ('L'..'Z').to_a.sample
  end
end

# registration area
# CSV.foreach('vehicles.csv', headers: true) do |line|
#   case line[4]
#   when 'birmingham'
#     birmingham_area_codes = 'B' + %w[A B C].sample
#     puts birmingham_area_codes
#   when 'swansea'
#     swansea_area_codes = 'C' + generate_second_letter(swansea: true)
#     # puts swansea_area_codes
#   else
#     cardiff_area_codes = 'C' + generate_second_letter(swansea: false)
#     # puts cardiff_area_codes
#   end
# end

# cleaner way to use the names
# CSV.foreach('new_vehicles.csv', headers: true, header_converters: :symbol) do |cars|
#   puts cars[:registrationarea] # weird way as the header is camel cased
# end

# csv_table = CSV.read('vehicles.csv', :headers => true)
# csv_table.delete('vin')
# csv_table.delete('make')
# csv_table.delete('colour')

# Better way again - cleanses the file to just work with what you need for data generation
csv_table = CSV.read('new_vehicles.csv', :headers => true)
csv_table.delete('vin')
csv_table.delete('make')
csv_table.delete('colour')


area_codes = []

csv_table['registrationArea'].each do |area|
  case area
  when 'birmingham'
      birmingham_area_codes = 'B' + %w[A B C].sample
      area_codes << birmingham_area_codes
    when 'swansea'
      swansea_area_codes = 'C' + generate_second_letter(swansea: true)
      area_codes << swansea_area_codes
    else
      cardiff_area_codes = 'C' + generate_second_letter(swansea: false)
      area_codes << cardiff_area_codes
    end
end

# puts area_codes


full_table = CSV.read('vehicles.csv', headers: true)
full_table.delete('vin')
full_table.delete('make')
full_table.delete('colour')
full_table.delete('dateOfManufacture')



# can I just put my logic in these iteration methods here load in here to create my reg numbers
