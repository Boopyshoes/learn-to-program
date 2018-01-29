def sort(some_array)
  recursive_sort(some_array,[])
end

def recursive_sort(unsorted_array, sorted_array)
    # if the unsorted_array is empty we are done
    if unsorted_array.empty?
      return sorted_array
    end
    
    # find the 'smallest' remaining value in the array 
    sorted_element = unsorted_array[0]
    unsorted_array.each do |element|
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
    unsorted_array.each do |element|
      if element == sorted_element
        sorted_array.push(sorted_element)
      end
    end
    
    #recursive call
    recursive_sort(unsorted_array - [sorted_element], sorted_array)
end

test_array = ['bananas','Bananas','apples','Cider','Grapefruit','cheese','wine','snacks','Applesauce', 'snacks']
puts test_array.to_s
puts sort(test_array).to_s
