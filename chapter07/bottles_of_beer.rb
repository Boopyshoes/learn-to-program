# 99 Bottles of Beer on the Wall

number_of_bottles = 99
bottles_lyrics = [' bottles of beer on the wall', ' bottles of beer!']

while number_of_bottles >= 1

  puts number_of_bottles.to_s + bottles_lyrics[0] + ','
  puts number_of_bottles.to_s + bottles_lyrics[1]
  puts 'Take one down, pass it around,'
  number_of_bottles = number_of_bottles - 1
  if number_of_bottles == 1
    bottles_lyrics = [' bottle of beer on the wall', ' bottle of beer!']
    puts number_of_bottles.to_s + bottles_lyrics[0] + '!'
    
  elsif number_of_bottles == 0
    puts 'and all the bottles are done!'
  else
    puts number_of_bottles.to_s + bottles_lyrics[0] + '!'
  end
  puts
  
end
