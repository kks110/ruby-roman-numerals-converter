require './converter'

puts "You can write numbers between 1 and 3999 using Roman Numerals."
puts "I = 1"
puts "V = 5"
puts "X = 10"
puts "L = 50"
puts "C = 100"
puts "D = 500"
puts "M = 1000"
puts ""

converter = Converter.new

converter.get_number
