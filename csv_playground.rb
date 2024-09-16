require 'csv'
require 'date'


# Date range 	Rule 	Example
# March - Aug Year without century 	01-05-2024 = 24
# Sep - Feb  	Year without century + 50 	01-09-2024 = 74

months_of_the_year = {
  january: 1,
  february: 2,
  march: 3,
  april: 4,
  may: 5,
  june: 6,
  july: 7,
  august: 8,
  september: 9,
  october: 10,
  november: 11,
  december: 12
}

dates = []

CSV.foreach('new_vehicles.csv', headers: true) do |date|
  date.delete('vin')
  date.delete('make')
  date.delete('colour')
  date.delete('registrationArea')

  binding.irb
  if Date.parse(date['dateOfManufacture']).month > months_of_the_year[:february] && Date.parse(date['dateOfManufacture']).month < months_of_the_year[:september]
    dates << date['dateOfManufacture'].split('-')[2][-2..-1]
  elsif Date.parse(date['dateOfManufacture']).month > months_of_the_year[:august] && Date.parse(date['dateOfManufacture']).month < months_of_the_year[:march]
    date = date['dateOfManufacture'].split('-')[2][-2..-1].to_i + 50
    dates << date.to_s
  end
  # dates << date['dateOfManufacture']
end

def modify_without_century(dates)
  dates.map { |date| date.split('-')[2][-2..-1] }
end
