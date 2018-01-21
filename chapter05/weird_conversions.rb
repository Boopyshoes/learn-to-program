puts '15'.to_f # converts the string 15 to a floating point number, resulting in an output of 15.0
puts '99.999'.to_f # converts the string '99.999' to the float 99.999 for output
puts '99.999'.to_i # converts the string '99.999' to the integer 99 (truncated as in integer division) for output
puts ''
puts '5 is my favorite number!'.to_i # '5' is understood as convertible to an integer, but the rest of the string isn't and is ignored, resulting in 5 as the integer output
puts 'Who asked you about 5 or whatever?'.to_i # The first character 'W' doesn't make sense as an integer, so the string is ignored an 0 is output
puts 'Your momma did.'.to_f # The first character 'Y' doesn't make sense as a float, so the string is ignored and 0.0 is output
puts ''
puts 'stringy'.to_s # doesn't affect the output because 'stringy' is already a string
puts  3.to_i # doesn't affect the output because 3 is already an integer
puts ''

# these next 4 all have the same output, because...
# puts means put string, and the way it works is it takes the object you've given it 
# applies .to_s to get the string version of that object before it outputs it to the screen
puts 20
puts 20.to_s
puts '20'
puts '20'.to_i #so after converting '20' to an integer (.to_i), it's converted to a string (.to_s) before it's output


