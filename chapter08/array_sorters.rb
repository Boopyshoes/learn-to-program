word_list = []
while true
  puts 'enter your next word (just hit <enter> to quit)'
  next_word = gets.chomp
  if next_word != '' 
    word_list.push next_word
  end
  
  if next_word == ''
    break
  end
end

word_list.sort!
if word_list.length > 0
  puts 'here are the words you entered, sorted:'
  word_list.each do |word|
    puts word
  end
else
  puts 'you didn\'t enter any words'
end
