
class RomanConverter
  # The Roman numerals.
  def initialize
    @units = %w[I I II III IV V VI VII VIII IX]
    @tens = %w[X X XX XXX XL L LX LXX LXXX XC]
    @hundreds = %w[C C CC CCC DC D DC DCC DCCC CM]
    @thousands = %w[M M MM MMM]

    puts 'You can write numbers between 1 and 3999 using Roman Numerals.'
    puts 'I = 1'
    puts 'V = 5'
    puts 'X = 10'
    puts 'L = 50'
    puts 'C = 100'
    puts 'D = 500'
    puts 'M = 1000'
    puts ''
  end

  def run
    roman_convert(enter_number)
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
    user_input
  end

  # Checks if input is a number, then if its between 1 and 3999.
  def valid_input?(input)
    if input =~ /\A\d+\Z/
      if input.to_i > 0 and input.to_i < 4000
        true
      else
        false
      end
    else
      false
    end
  end

  # Takes the input. Makes it an array.
  # Does the conversion, outputs what that number is and
  # # adds it to the numerals array.
  # Then out puts the final number.
  def roman_convert(input)
    numerals_string = []
    input_array = input.split('')

    until input_array.empty?
      case input_array.length
      when 4
        puts "#{input_array.first}000 = #{@thousands[input_array.first.to_i]}"
        numerals_string.push(@thousands[input_array.shift.to_i])
      when 3
        puts " #{input_array.first}00 = #{@hundreds[input_array.first.to_i]}"
        numerals_string.push(@hundreds[input_array.shift.to_i])
      when 2
        puts "  #{input_array.first}0 = #{@tens[input_array.first.to_i]}"
        numerals_string.push(@tens[input_array.shift.to_i])
      when 1
        puts "   #{input_array.first} = #{@units[input_array.first.to_i]}"
        numerals_string.push(@units[input_array.shift.to_i])
      else
        break
      end
    end

    puts ''
    puts 'Your number converted to Roman Numerals is: '
    puts "#{numerals_string.join}"
    puts ''
  end


end
