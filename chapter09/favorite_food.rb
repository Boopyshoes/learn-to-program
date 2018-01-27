def favorite_food name
  if name == 'Lister'
    return 'vindaloo'
  end
  
  if name == 'Rimmer'
    return 'mashed potatoes'
  end
  
  'hard to say...maybe fried plantain?'
end

def favorite_drink name
  if name == 'Joan-Luc' # my dream of a gender-bent picard cosplay by Nicole Marie Jean
    'tea, Earl Grey, hot'
  elsif name == 'Kathryn'
    'coffee, black'
  else
    'perhaps...horchata?'
  end
end

puts favorite_food('Rimmer')
puts favorite_food('Lister')
puts favorite_food('Cher')

puts favorite_drink('Kathryn')
puts favorite_drink('Oprah')
puts favorite_drink('Joan-Luc')

