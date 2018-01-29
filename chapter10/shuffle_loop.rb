def shuffle(some_array)
  shuffled_array = []
  while !some_array.empty?
    index = rand(some_array.length)
    puts index
    shuffled_array.push(some_array[index])
    # some_array = some_array.delete_at(index)
    some_array[index] = nil
    some_array.compact!
    # puts some_array.to_s
  end
  shuffled_array
end

test_array = Array.new
test_array = [1,2,3,4,5,4,3,2,1]

puts test_array.to_s
puts test_array.length
puts shuffle(test_array).to_s
