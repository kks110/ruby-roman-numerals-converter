
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
    input = input.split('')

    puts "   #{input.last} = #{@units[input.last.to_i - 1]}"
    numerals_string.unshift( @units[input.pop.to_i - 1] )

    unless input.empty?
      puts "  #{input.last}0 = #{@tens[input.last.to_i - 1]}"
      numerals_string.unshift( @tens[input.pop.to_i - 1] )
    end

    unless input.empty?
      puts " #{input.last}00 = #{@hundreds[input.last.to_i - 1]}"
      numerals_string.unshift( @hundreds[input.pop.to_i - 1] )
    end

    unless input.empty?
      puts "#{input.last}000 = #{@thousands[input.last.to_i - 1]}"
      numerals_string.unshift( @thousands[input.pop.to_i - 1] )
    end

    puts ''
    puts 'Your number converted to Roman Numerals is: '
    puts "#{numerals_string.join}"
  end


end
