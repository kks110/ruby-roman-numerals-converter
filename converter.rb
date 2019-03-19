
class Converter
  @@units = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
  @@tens = ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  @@hundreds = ["C", "CC", "CCC", "DC", "D", "DC", "DCC", "DCCC", "CM"]
  @@thousands = ["M"]

  def get_number
    puts "Please enter a number between 1 and 3999: "
    user_input = gets.chomp
    if valid_input?(user_input)
      puts "Valid input"
    else
      puts "Invalid input"
    end
  end

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




end
