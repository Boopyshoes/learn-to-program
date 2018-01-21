# puts 'Hello there, and what\'s your name?'
# name = gets.chomp # uses the .chomp method to remove any Enter characters at the end of the user input before assigning it to the variable name
# puts 'Your name is ' + name + '? What a lovely name!'
# puts 'Pleased to meet you, ' + name + '. :)'

puts 'Hello there, and what\'s your first name? '
first_name = gets.chomp 

puts 'What\'s your middle name, ' + first_name + '? '
middle_name = gets.chomp

puts 'I really need your last name to be able to properly address you, so could you tell me that, too? '
last_name = gets.chomp

puts 'It\'s so nice to formally meet you, ' + first_name + ' ' + middle_name + ' ' + last_name + '! I hope we can be friends like Alan and I used to be.'

puts ''
puts 'Now that we\'ve met, ' + first_name + ', I\'d like to learn a little bit more about you.'
puts 'What\'s your favorite number? '
favorite_number = gets.chomp

puts favorite_number +'!'
puts 'Really?!'
puts  'I thought someone as intelligent as you are would at least want ' + (favorite_number.to_i + 1).to_s + '.'
puts 'It is, after all, bigger and better than ' + favorite_number + '.'
puts 'It\'s just a thought, though. It\'s your favorite number, not mine.'


