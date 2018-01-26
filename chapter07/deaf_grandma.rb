# Trying to talk to your deaf grandma
puts 'And here we are, trying to talk to grandma.' 
puts 'She\'s a little hard of hearing, so speak up!'
consecutive_bye_shout = 0
year_grandma_got_frisky = 1923
number_of_frisky_years = 15
speak_up_text = 'Huh?! I don\'t think I heard you right.'

while true
  print 'What do you want to say to grandma? '
  what_you_said = gets.chomp
  if what_you_said == what_you_said.upcase
    
    if what_you_said == 'BYE'
      consecutive_bye_shout = consecutive_bye_shout + 1
      puts speak_up_text
    else
      which_year = rand(number_of_frisky_years).to_i + year_grandma_got_frisky
      puts 'Grandma says: "Not since ' + which_year.to_s + '. THAT was a fun year!"'
      consecutive_bye_shout = 0
    end
  else
    puts speak_up_text
    consecutive_bye_shout = 0
  end
  
  if consecutive_bye_shout == 3
    puts 'Grandma says: "Ok, I realize you have to get going. It was great to see you!"'
    puts 'You\'ve finally escaped! Quick, get out before you\'re eaten by a grue.'
    break
  end
end
