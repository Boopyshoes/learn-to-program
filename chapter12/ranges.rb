# This is your range literal.
letters = 'a'..'c'

# Convert this range to an array and compare
puts (['a','b','c']) == letters.to_a

#Iterate over a range:
('A'..'Z').each do |letter|
  print letter
end

bless_the_70s = 1970..1979
puts bless_the_70s.min
puts bless_the_70s.max
puts(bless_the_70s.include?(1979)) # touch pad has me bouncing all over the screen
puts(bless_the_70s.include?(1980))
puts(bless_the_70s.include?(1974.5)) # this one is at least interesting. Guessing false though
