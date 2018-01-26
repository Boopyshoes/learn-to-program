=begin
puts 'Hello, what\'s your name?'
name = gets.chomp
puts 'Hello, ' + name + '.'

if name == 'Chris'
  puts 'What a lovely name!'
end
=end

puts 'I am a fortune teller. Tell me your name: '
name = gets.chomp

if name == 'Dan'  || name == 'Pippin'
 
  puts 'I see great things in your future.'

else
  
  puts 'Your future is... oh my! Look at the time!'
  puts 'I really have to be going, sorry!'

end
