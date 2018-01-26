i_am_dan = true
i_am_purple = false
i_like_beer = true
i_eat_rocks = false

puts i_am_dan && i_like_beer
puts i_like_beer && i_eat_rocks
puts i_am_purple && i_like_beer
puts i_am_purple && i_eat_rocks

puts

puts i_am_dan || i_like_beer
puts i_like_beer || i_eat_rocks
puts i_am_purple || i_like_beer
puts i_am_purple || i_eat_rocks

puts 

puts !i_am_purple
puts !i_am_dan
