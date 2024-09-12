# Implementation Experimentation Playground
birmingham = 'Birmingham'
neath = 'Neath'

VALID_AREA_CODES = %w[london swansea birmingham].map(&:capitalize).freeze

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


# invalid letters to validate against - if letter contains one of these, move to invalid group
%w[i k m y].map(&:upcase)
