# require 'csv'
# require 'date'
# require_relative 'age_identifier'
#
#
# # Date range 	Rule 	Example
# # March - Aug Year without century 	01-05-2024 = 24
# # Sep - Feb  	Year without century + 50 	01-09-2024 = 74
#
# months_of_the_year = {
#   january: 1,
#   february: 2,
#   march: 3,
#   april: 4,
#   may: 5,
#   june: 6,
#   july: 7,
#   august: 8,
#   september: 9,
#   october: 10,
#   november: 11,
#   december: 12
# }
#
# def modify_without_century(date)
#   date.to_s.chomp.split('-')[2][-2..-1]
# end
#
# def extract_year(date)
#   dates = []
#   if Date.parse(date).month > AgeIdentifier::MONTHS_OF_THE_YEAR[:february] && Date.parse(date).month < AgeIdentifier::MONTHS_OF_THE_YEAR[:september]
#     # date = date.to_s.chomp.split('-')[2][-2..-1].to_i + 50
#     dates << modify_without_century(date)
#   else
#     date = modify_without_century_add_fifty(date)
#     dates << date.to_s
#   end
# end
#
#
# def modify_without_century_add_fifty(date)
#   date.to_s.chomp.split('-')[2][-2..-1].to_i + 50
# end
#
#
#
# dates = []
#
# # process the year by here. Then load it through the function to modify it
# # They should go through and resume correct position in the array
#
# CSV.foreach('new_vehicles.csv', headers: true) do |date|
#   date.delete('vin')
#   date.delete('make')
#   date.delete('colour')
#   date.delete('registrationArea')
#
#   if Date.parse(date['dateOfManufacture']).month > months_of_the_year[:february] && Date.parse(date['dateOfManufacture']).month < months_of_the_year[:september]
#     # date = date.to_s.chomp.split('-')[2][-2..-1].to_i + 50
#     dates << modify_without_century(date)
#   else
#     date = modify_without_century_add_fifty(date)
#     dates << date.to_s
#   end
# end
#
#
#
#
# areas = []
# codes = []
# count = 0
# cities = []
#
# # programmatically delete all irrelevant data from the csv
# CSV.foreach('new_vehicles.csv', headers: true) do |row|
#   # CSV.foreach('vehicles.csv', headers: true) do |row|
#   row.delete('vin')
#   row.delete('make')
#   row.delete('colour')
#   row.delete('dateOfManufacture')
#
#   areas << row.to_h
#   cities << row['registrationArea']
# end
#
# areas.each do |area|
#   case area['registrationArea']
#   when 'birmingham'
#     codes << "B#{+ %w[A B C].sample} #{RandomLetters.generate}"
#   when 'swansea'
#     codes << "C#{+ generate_second_letter(swansea: true)} #{} #{RandomLetters.generate}"
#   when 'cardiff'
#     codes << "C#{+ generate_second_letter(swansea: false)} #{RandomLetters.generate}"
#   else
#     count += 1
#   end
# end
# def count_invalid_reg_numbers
#   full_table = CSV.read('vehicles.csv', headers: true)
#   count = 0
#   full_table['registrationArea'].each do |area|
#     if AreaCodes::VALID_AREA_CODES.include?(area)
#       'valid'
#     else
#       count +=1
#     end
#   end
#   "Number of registration numbers not created: #{count}"
# end

