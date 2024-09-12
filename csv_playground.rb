require 'csv'

# read in the vehicles file
# table = CSV.parse(File.read("vehicles.csv"), headers: true)



# colour
# table = CSV.foreach('vehicles.csv') { |line| puts line[1] }
# # vin
# table = CSV.foreach('vehicles.csv') { |line| puts line[3] }


# make
table = CSV.foreach('vehicles.csv') { |line| puts line[0] }
# date of manufacture
table = CSV.foreach('vehicles.csv') { |line| puts line[2] }
# registration area
table = CSV.foreach('vehicles.csv') { |line| puts line[4] }
# can I just put my logic in these iteration methods here load in here to create my reg numbers
