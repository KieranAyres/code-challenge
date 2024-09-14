# Implementation Experimentation Playground
require 'csv'
require_relative 'random_three_letters'

birmingham = 'Birmingham'
neath = 'Neath'

# VALID_AREA_CODES = %w[london swansea birmingham].map(&:capitalize).freeze
VALID_AREA_CODES = %w[cardiff swansea birmingham].freeze

if VALID_AREA_CODES.include?(birmingham)
  area_code = 'B' + %w[A B C].sample
  puts area_code
end

def random_letter_generator

end

# will need a case statement

# digit is going to come from the line in the csv

#

def compose_vrn

end

def reg_numbers_generated(reg_numbers)
  puts "Total number of registration numbers: #{reg_numbers}"
end



# CSV.foreach(table) do |row|
#   # Process each row, in this example, print A summary of fields,
#   # by header, in an ASCII compatible String.
#   puts row.inspect
# end

# process them from here
# create a licence from the data available
# then validate that against the rules set out as part of the requirements

# validate the area code against this

# roughly requirement number 3
# def count_invalid_reg_numbers
#   full_table = CSV.read('vehicles.csv', headers: true)
#   count = 0
#   full_table['registrationArea'].each do |area|
#     if VALID_AREA_CODES.include?(area)
#       'valid'
#     else
#       count +=1
#     end
#   end
#   puts count
# end

RandomThreeLetters.generate

