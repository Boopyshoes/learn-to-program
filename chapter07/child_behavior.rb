while true

    puts 'What would you like to ask this child to do?'
    request = gets.chomp
    puts 'You say you want this child to please ' + request + '?'
    puts 'They say:'
    puts 'Papa ' + request + ', too.'
    puts 'Mama ' + request + ', too.'
    puts 'Ruby ' + request + ', too.'
    puts 'Nono ' + request + ', too.'
    puts 'Emma ' + request + ', too.'
    puts # blank line
    
    if request == 'stop'
      break
    end
    
    
end

  
