def say_moo number_of_moos
  puts 'moo.....' * number_of_moos
  'yellow submarine'
end

say_moo(1)
say_moo(14)
puts 'coin-coin'
say_moo(0)
return_val = say_moo(3)
puts 'say_moo returned ' + return_val.to_s.capitalize + ', dude..'
puts return_val.to_s.capitalize + '.'



