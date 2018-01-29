def sort(some_array)
  # puts 'the array passed in is: '
  # puts some_array
  sorted_array = []
  while !some_array.empty?
    
    # find the 'smallest' remaining value in the array 
    sorted_element = some_array[0]
    some_array.each do |element|
      if element.downcase < sorted_element.downcase
        sorted_element = element
      elsif element.downcase == sorted_element.downcase
        # check for a smaller value including case
        if element < sorted_element
          sorted_element = element
        end
      else
        # nothing
      end
      
    end
    
    # push the lowest value into the array every time it occurs
    # this preserves the number of occurrences
    some_array.each do |element|
      if element == sorted_element
        sorted_array.push(sorted_element)
        # puts 'Current state of the array is: '
        # puts sorted_array
      end
    end
    
    #remove all occurrences of the sorted_element
    some_array = some_array - [sorted_element]
    # puts 'current state of some_array: ' + some_array.to_s
  end
  sorted_array
end

test_array = ['bananas','Bananas','apples','Cider','Grapefruit','cheese','wine','snacks','Applesauce', 'snacks']
puts 'The original array'
puts test_array.to_s

puts 'The array sorted by our function:' 
puts sort(test_array).to_s
puts 'The array as it exists after our function:'
puts test_array.to_s
