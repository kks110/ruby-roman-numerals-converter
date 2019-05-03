
class Converter
  # The Roman numerals.

  def initialize
    @units = %w[I II III IV V VI VII VIII IX]
    @tens = %w[X XX XXX XL L LX LXX LXXX XC]
    @hundreds = %w[C CC CCC DC D DC DCC DCCC CM]
    @thousands = %w[M MM MMM]
  end

  # Gets the number.
  def enter_number
    puts 'Please enter a number between 1 and 3999: '
    user_input = gets.chomp

    # Checks its valid.
    until valid_input?(user_input)
      puts 'Invalid input, please enter a number between 1 and 3999: '
      user_input = gets.chomp
    end
    puts ''
    # Converts it.
    roman_convert(user_input)
  end

  # Checks if input is a number, then if its between 1 and 3999.
  def valid_input?(input)
    if input =~ /\A\d+\Z/
      if input.to_i > 0 && input.to_i < 4000
        true
      else
        false
      end
    else
      false
    end
  end

  # Takes the input. Makes it an array.
  # Does the conversion, outputs what that number is
  # and adds it to the numerals array.
  # Then out puts the final number.
  def roman_convert(input)
    numerals_string = []
    number_length = input.to_s.split('').length
    input_array = input.split('')

    puts number_length
    until input_array.empty?
      case number_length
      when 4
        puts 'Length of 4'
        puts "#{input_array.last}000 = #{@thousands[input_array.last.to_i - 1]}"
        numerals_string.push( @thousands[input_array.pop.to_i - 1])
      when 3
        puts 'Length of 3'
        puts " #{input_array.last}00 = #{@hundreds[input_array.last.to_i - 1]}"
        numerals_string.push( @hundreds[input_array.pop.to_i - 1])
      when 2
        puts 'Length of 2'
        puts " #{input_array.last}0 = #{@tens[input_array.last.to_i - 1]}"
        numerals_string.push( @tens[input_array.pop.to_i - 1])
      when 1
        puts 'Length of 1'
        puts " #{input_array.last} = #{@units[input_array.last.to_i - 1]}"
        numerals_string.push( @units[input_array.pop.to_i - 1])
      else
        break
      end
    end

    puts ''
    puts 'Your number converted to Roman Numerals is: '
    puts "#{numerals_string.join}"
  end


end
