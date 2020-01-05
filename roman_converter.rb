class RomanConverter
  # The Roman numerals.
  def initialize
    @numerals = {
        M: 1000,
        CM: 900,
        D: 500,
        CD: 400,
        C: 100,
        XC: 90,
        L: 50,
        XL: 40,
        X: 10,
        IX: 9,
        V: 5,
        IV: 4,
        I: 1
    }
  end

  def run
    digit_convert(enter_number)
  end

  private

  # Gets the number.
  def enter_number
    puts 'Please enter a Roman Numeral: '
    user_input = gets.chomp.upcase

    # Checks its valid.
    until valid_input?(user_input)
      puts 'Invalid input, please enter a valid Roman Numeral: '
      user_input = gets.chomp
    end
    puts ''
    user_input
  end

  def valid_input?(input)
    if input =~ /^([^0-9]*)$/
      if input.count('^IVXLCDM').zero?
        true
      else
        puts 'String contains characters that are not Roman numerals.'
        false
      end
    else
      puts 'String contains a number'
      false
    end
  end

  # Takes the input. Makes it an array.
  # Does the conversion, outputs what that number is and
  # adds it to the numerals array.
  # Then out puts the final number.
  def digit_convert(input)
    sum = 0
    until input.empty?
      @numerals.each_key do |k|
        if input.start_with?(k.to_s)
          sum += @numerals[k]
          puts "#{k.to_s} = #{@numerals[k]}"
          input.slice! k.to_s
        end
      end
    end
    puts "Your number converted to arabic numbers is: #{sum}"
  end
end
