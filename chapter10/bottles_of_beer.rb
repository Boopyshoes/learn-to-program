def english_number(number)
  if number < 0 # no negative numbers
    return 'Please enter a number that isn\'t negative'
  end
  if number == 0
    return 'zero'
  end
  # no more special cases! no more returns!
  num_string = '' # this is the string we will return
  ones_place = ['one',        'two',        'three',
                'four',       'five',       'six',
                'seven',      'eight',      'nine'
               ]
  tens_place = ['ten',        'twenty',     'thirty',
                'forty',      'fifty',      'sixty',
                'seventy',    'eighty',     'ninety'
               ]
  teenagers  = ['eleven',     'twelve',     'thirteen',
                'fourteen',   'fifteen',    'sixteen',
                'seventeen',  'eighteen',   'nineteen'
               ]
  
  # "left" is how much is left of the number
  #     we still have left to write out.
  # "write" is the part we are
  #     writing right now.
  # write and left, get it?
  left = number
  write = left / 1_000_000_000_000
  left  = left - write * 1_000_000_000_000
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' trillion'
    if left > 0
      num_string = num_string + ' '
    end
  end
  write = left / 1_000_000_000
  left  = left - write * 1_000_000_000
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' billion'
    if left > 0
      num_string = num_string + ' '
    end
  end
  write = left / 1_000_000
  left  = left - write * 1_000_000
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' million'
    if left > 0
      num_string = num_string + ' '
    end
  end
  write = left / 1000
  left  = left - write * 1000
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' thousand'
    if left > 0
      num_string = num_string + ' '
    end
  end
  write = left / 100
  left  = left - write * 100
  if write > 0
    hundreds = english_number(write)
    num_string = num_string + hundreds + ' hundred'
    if left > 0
      num_string = num_string + ' '
    end
  end
  write = left / 10
  left = left - write * 10
  if write > 0
    if  ((write ==1) and (left > 0))
      num_string = num_string + teenagers[left - 1]
      left = 0
    else
      num_string = num_string  + tens_place[write - 1]
    end
    if left > 0
      num_string = num_string + '-'
    end
  end
  write = left
  left = 0
  if write > 0
    num_string = num_string + ones_place[write - 1]
  end
  num_string
end# 99 Bottles of Beer on the Wall

number_of_bottles = 9999
number_of_bottles_string = english_number(number_of_bottles).capitalize!
bottles_lyrics = [' bottles of beer on the wall', ' bottles of beer!']

while number_of_bottles >= 1
  puts number_of_bottles_string + bottles_lyrics[0] + ','
  puts number_of_bottles_string + bottles_lyrics[1]
  puts 'Take one down, pass it around,'
  number_of_bottles = number_of_bottles - 1
  number_of_bottles_string = english_number(number_of_bottles).capitalize!
  if number_of_bottles == 1
    bottles_lyrics = [' bottle of beer on the wall', ' bottle of beer!']
    puts number_of_bottles_string + bottles_lyrics[0] + '!'
    
  elsif number_of_bottles == 0
    puts 'No more bottles of beer on the wall!'
  else
    puts number_of_bottles_string + bottles_lyrics[0] + '!'
  end
  puts
  
end
