require './roman_converter'
require './digit_converter'



puts 'Welcome to the converter. How would you like to convert?'
puts '1: Roman to Digits'
puts '2: Digits to Roman'
input = gets.chomp

until input == '1' || input == '2'
  puts 'Please enter either 1 or 2'
  input = gets.chomp
end

converter = if input == '1'
              RomanConverter.new
            else
              DigitConverter.new
            end

converter.run

