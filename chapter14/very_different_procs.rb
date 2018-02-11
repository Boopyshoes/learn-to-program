# this example is meant to show how very different procs act

def do_until_false( first_input, some_proc)
  input = first_input
  output = first_input
  # for the 'yum' proc, we pass in a string, it becomes input and output
  # first time through the while, input becomes the same string at the top
  # and output = false
  # then we fail the test at the top and skip out, returning the original string.  Got it.
  while output
    input = output
    output = some_proc.call(input)
  end
  input
end

always_false = Proc.new do |just_ignore_me|
  false
end

build_array_of_squares = Proc.new do |array|  # so, we pass in [5], and we get back [25,4]
  last_number = array.last                    # we pass n [25,4], and we get back [25, 16, 3], and so on...
  if last_number <= 0
    false
  else
    array.pop # take off teh last number
    array.push(last_number * last_number)
    array.push(last_number - 1)
  end
end

puts do_until_false([15], build_array_of_squares).inspect #so, I pass in a 1 element array with a 5
yum = 'lemonade with a hint of orange blossom water'
puts do_until_false(yum, always_false)

  #trying to understand this code here....