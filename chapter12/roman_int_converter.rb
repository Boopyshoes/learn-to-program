def roman_to_int (roman_numeral)
  roman_int = 0  # default to 0
  if valid_roman(roman_numeral) 
    i = 0
    while i < (roman_numeral.length - 1)
      if roman_numeral[i].upcase == 'M'
        roman_int = roman_int + 1000
      elsif roman_numeral[i].upcase == 'D'
        roman_int = roman_int + 500
      elsif roman_numeral[i].upcase == 'L'
        roman_int = roman_int + 50
      elsif roman_numeral[i].upcase == 'V'
        roman_int = roman_int + 5
      elsif roman_numeral[i].upcase == 'C'
        if roman_numeral[i + 1].upcase == 'M'
          roman_int = roman_int + 900
          i = i + 1 
        elsif roman_numeral[i + 1].upcase == 'D'
          roman_int = roman_int + 400
          i = i + 1
        else
          roman_int = roman_int + 100
        end
      elsif roman_numeral[i].upcase == 'X'
        if roman_numeral[i + 1].upcase == 'C'
          roman_int = roman_int + 90
          i = i + 1
        elsif roman_numeral[i + 1].upcase == 'L'
          roman_int = roman_int + 40
          i = i + 1
        else
          roman_int = roman_int + 10
        end
      elsif roman_numeral[i].upcase == 'I'
        if roman_numeral[i + 1] == 'X'
          # if this is IX, add 9 and increment i to skip a char
          roman_int = roman_int + 9
          i = i + 1
        elsif roman_numeral[i + 1] == 'V'
          # if this is IV, add 4 and increment i to skip a char
          roman_int = roman_int + 4
          i = i + 1
        else
          # if this is just I, then just add 1
          roman_int = roman_int + 1
        end
      end
      i = i + 1
    end
  else
    # not a valid roman_int, leave the default value in roman_int
  end
  
  roman_int
end

def int_to_roman (user_int) # converts any number between 1 and 3000 to roman numeral
  roman = '' # default to an empty string
  if valid_int(user_int)
        
    thousands = user_int / 1000
    roman = 'M' * thousands
    
    remainder = user_int % 1000
    hundreds = remainder / 100
    if hundreds == 9
      roman = roman + 'CM'
      hundreds = 0
    elsif hundreds >= 5
      roman = roman + 'D'      
      hundreds = hundreds - 5
    elsif hundreds == 4
      roman = roman + 'CD'
      hundreds = 0
    end
    roman = roman + 'C' * hundreds
    
    remainder = remainder % 100
    tens = remainder / 10
    if tens == 9
      roman = roman + 'XC'
      tens =  0
    elsif tens >= 5
      roman = roman + 'L'
      tens = tens - 5
    elsif tens == 4
      roman = roman + 'XL'
      tens = 0
    end
    roman = roman + 'X' * tens
    
    ones = remainder % 10
    if ones == 9
      roman = roman + 'IX'
      ones = 0
    elsif ones >= 5
      roman = roman + 'V'
      ones = ones - 5
    elsif ones == 4
      roman = roman + 'IV'
      ones = 0
    end
    roman = roman + 'I' * ones
  end
  roman
end

def valid_roman (roman_numeral)
  not_roman_regex = /[^MmDdCcLlXxVvIi]/
  roman_regex = /[Mm]{0,3}(([Cc]([Mm]|[Dd]))|([Dd])?[Cc]{0,3})(([Xx]([Cc]|[Ll]))|([Ll])?[Xx]{0,3})(([Ii]([Xx])|[Vv])|([Vv])?[Ii]{0,3})/
  # if we get a match, this contains invalid characters
  if !not_roman_regex.match(roman_numeral)
    # next check if it's a validly formed roman numeral
    roman_regex.match(roman_numeral).to_s == roman_numeral
  end
end

def valid_int (int)
  # check if the number is in our range 1 to 3999
  (int <= 3999) && (int >=1)
end

def get_int
  while true
    puts 'Enter an integer between 1 and 3999 and I will convert it to a roman numeral.'
    number = gets.chomp
    if valid_int(number.to_i)
      break
    else
      puts 'That value is out of range for this converter.'
    end
  end
  number.to_i
end

def get_roman
  while true
    puts 'Enter a roman numeral between I and MMMCMXCIX and I will convert it to an integer.'
    roman_numeral = gets.chomp
    if valid_roman(roman_numeral)
      break
    else
      puts "#{roman_numeral} is not a vald roman numeral."
    end
  end
  roman_numeral
end

puts 'Welcome to the Roman/Arabic number converter.'
puts
while true
  puts 'Do you want to:'  
  puts '    1 - Convert Roman to Arabic'
  puts '    2 - Convert Arabic to Roman'
  puts
  print 'Make your selection [1/2]: '
  selection = gets.chomp
  if !(selection == '1' || selection == '2')
    puts 'you must enter a 1 or a 2.'
  else
    break
  end
end


if selection == '1'
  # get a roman numeral from the user and pass it to the roman_to_integer converter
  user_num = get_roman
  puts "#{user_num} is equivalent to #{roman_to_int(user_num)}"
elsif selection == '2'
  # get an integer from the user and pass it to the integer_to_roman converter
  user_num = get_int
  puts "#{user_num} is equivalent to #{int_to_roman(user_num)}"  
end

