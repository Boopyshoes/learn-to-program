def shuffle(some_array)
  recursive_shuffle(some_array,[])
end

def recursive_shuffle(source_array, shuffled_array)
  if source_array.empty?
    return shuffled_array
  end
  
  index = rand(source_array.length)
  shuffled_array.push(source_array[index])
  source_array[index] = nil
  recursive_shuffle(source_array.compact!, shuffled_array)

end

test_array = Array.new
test_array = [1,2,3,4,5,4,3,2,1]

puts test_array.to_s
puts test_array.length
puts shuffle(test_array).to_s
