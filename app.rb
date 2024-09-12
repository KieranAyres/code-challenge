require 'csv'

# read in the vehicles file
table = CSV.parse(File.read("vehicles.csv"), headers: true)

puts table

# process them from here
# create a licence from the data available
# then validate that against the rules set out as part of the requirements

%w[london swansea birmingham].freeze
# validate the area code against this


# invalid letters to validate against - if letter contains one of these, move to invalid group
%w[i k m y].upcase.freeze
