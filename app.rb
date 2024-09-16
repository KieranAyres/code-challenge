# Implementation Experimentation Playground
require 'csv'
require_relative 'random_three_letters'
require_relative 'area_codes'

# def compose_vrns
#
# end

def reg_numbers_generated(reg_numbers)
  puts "Total number of registration numbers: #{reg_numbers.count}"
end


# process them from here
# create a licence from the data available
# then validate that against the rules set out as part of the requirements

# validate the area code against this

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

binding.irb
RandomThreeLetters.generate

