# frozen_string_literal: true
require 'csv'
require 'date'

module AgeIdentifier

  csv = CSV.read('new_vehicles.csv', headers: true)
  csv.delete('make')
  csv.delete('registrationArea')
  csv.delete('vin')
  csv.delete('colour')


  csv.each do |date|
    # some logic here to:
    # cut the day
    # the month will determine whether it will be a 20 or a 70 plate
    # use gsub to do this, should be simple enough, like I did for the letter jumble

    # pass the year in as month and year
    # Need the month to determine what to do, need the year to determine the year
    Date.parse(date.to_s).strftime('%Y-%m')
  end
  # Date range 	Rule 	Example
  # March - Aug 01-05-2024 = 24
  # Sep - Feb Year + 50 	01-09-2024 = 74



end
