class Integer
  def to_roman
    roman = '' # default to an empty string          
    thousands = self / 1000
    roman = 'M' * thousands
    
    remainder = self % 1000
    hundreds = remainder / 100
    if hundreds == 9
      roman = roman + 'CM'
      hundreds = 0
    elsif hundreds >= 5
      roman = roman + 'D'      
      hundreds = hundreds - 5
    elsif hundreds == 4
      roman = roman + 'CD'
      hundreds = 0
    end
    roman = roman + 'C' * hundreds
    
    remainder = remainder % 100
    tens = remainder / 10
    if tens == 9
      roman = roman + 'XC'
      tens =  0
    elsif tens >= 5
      roman = roman + 'L'
      tens = tens - 5
    elsif tens == 4
      roman = roman + 'XL'
      tens = 0
    end
    roman = roman + 'X' * tens
    
    ones = remainder % 10
    if ones == 9
      roman = roman + 'IX'
      ones = 0
    elsif ones >= 5
      roman = roman + 'V'
      ones = ones - 5
    elsif ones == 4
      roman = roman + 'IV'
      ones = 0
    end
    roman + 'I' * ones
  end
end

class Array
  def shuffle
    recursive_shuffle(self,[])
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

end

int_str = ['0','1','2','3'].shuffle.join.to_s
puts int_str

puts int_str.to_i.to_roman