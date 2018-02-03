dict_array = [] # array literal; same as Array.new
dict_hash = {} # hash literal; same as Hash.new

dict_array[0]       = 'candle'
dict_array[1]       = 'glasses'
dict_array[2]       = 'truck'
dict_array[3]       = 'Alicia'

# apparently this hash is made from the words his very
# young daughter used and what they referred to
dict_hash['shia-a'] = 'candle'
dict_hash['shaya']  = 'glasses'
dict_hash['shasha'] = 'truck'
dict_hash['sh-sha'] = 'Alicia'

dict_array.each do |word|
  puts word
end

dict_hash.each do |c_word, word|
  puts "#{c_word}: #{word}"
end

# So now he's talking about how you can use hashes in some pretty weird ways.
# The key (the part on the left, like 'shia-a', etc) doesn't hvae to be a string.
# could be any object at all, which means Integers, Strings, arrays, other hashes
# *shrug* let's copy in this weird code and see what happens

weird_hash = Hash.new
weird_hash[12] = 'monkeys'
weird_hash[[]] = 'emptiness'
weird_hash[Time.new] = 'no time like the present'

# let's convert this to a string and see what we get
puts weird_hash.to_s