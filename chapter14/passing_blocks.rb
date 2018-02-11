class Array
  def each_even( &was_a_block__now_a_proc)
    # We start with true because arrays start with 0 which is even....
    is_even = true
    self.each do |object|
      if is_even
        was_a_block__now_a_proc.call(object)
      end
      # toggle from even to odd/vice versa
      is_even = !is_even
    end
  end
end

fruits = ['apple', 'bad apple', 'cherry', 'durian']

# happy to see durian cause it makes me think of steven universe <3
fruits.each_even do |fruit|
  puts "Yum! I just love #{fruit} pies, don't you?"
end

# I'm going to have to read more about these.
# Time for another drink for me and the Mrs.... coffee, not booze brb

# "remember, we are getting even numbered elements
# of the array, which in this case are all odd numbers because I live
# only to irritate you"  --our dear author

[1,2,3,4,5].each_even do |odd_ball|
  puts "#{odd_ball} is NOT an even number!"
end