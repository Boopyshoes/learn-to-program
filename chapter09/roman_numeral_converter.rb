def num_to_roman (arabic_number) # converts any number between 1 and 3000 to roman numeral
  
  thousands = arabic_number / 1000
  roman = 'M' * thousands
  
  remainder = arabic_number % 1000
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

puts 'Enter a number between 1 and 3999 and I will convert it to a roman numeral.'
while true
  number = gets.chomp
  if number.to_i <= 3999 && number.to_i >=1
    roman_numeral = num_to_roman (number.to_i)
    puts number + ' as a roman numeral is ' + roman_numeral  + '.'
    break
  else
    puts 'That value is out of range for this converter.'
    puts 'Please enter a number between 1 and 3999'
  end
end
