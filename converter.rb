
class Converter
  # The Roman numerals.
  @@units = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  @@tens = ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  @@hundreds = ["C", "CC", "CCC", "DC", "D", "DC", "DCC", "DCCC", "CM"]
  @@thousands = ["M", "MM", "MMM"]

  # Gets the number.
  def get_number
    puts "Please enter a number between 1 and 3999: "
    user_input = gets.chomp

    # Checks its valid.
    while !valid_input?(user_input)
      puts "Invalid input, please enter a number between 1 and 3999: "
      user_input = gets.chomp
    end
    puts ""
    # Converts it.
    convert(user_input)

  end

  # Checks if input is a number, then if its between 1 and 3999.
  def valid_input?(input)
    if input =~ /\A\d+\Z/
      if input.to_i > 0 and input.to_i < 4000
        return true
      else
        return false
      end
    else
      return false
    end
  end

  # Takes the input. Makes it an array.
  # Does the conversion, outputs what that number is and adds it to the numerals array.
  # Then out puts the final number.
  def convert(input)
    numerals_string = []
    input = input.split("")

    puts "   #{input.last} = #{@@units[input.last.to_i - 1]}"
    numerals_string.unshift( @@units[input.pop.to_i - 1] )

    if !input.empty?
      puts "  #{input.last}0 = #{@@tens[input.last.to_i - 1]}"
      numerals_string.unshift( @@tens[input.pop.to_i - 1] )
    end

    if !input.empty?
      puts " #{input.last}00 = #{@@hundreds[input.last.to_i - 1]}"
      numerals_string.unshift( @@hundreds[input.pop.to_i - 1] )
    end

    if !input.empty?
      puts "#{input.last}000 = #{@@thousands[input.last.to_i - 1]}"
      numerals_string.unshift( @@thousands[input.pop.to_i - 1] )
    end

    puts ""
    puts "Your number converted to Roman Numerals is: "
    puts "#{numerals_string.join}"
  end


end
