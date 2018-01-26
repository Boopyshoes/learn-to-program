# Print the leap years between 2 years given by the user

puts 'This program will print all the leap years between the years you specify.'
print 'What is the starting year? '
starting_year = gets.chomp
print 'What is the ending year? '
ending_year = gets.chomp
puts
puts 'The leap years between ' + starting_year.to_s + ' and ' + ending_year.to_s + ' are:'
year = starting_year.to_i
while year <= ending_year.to_i
  if (year % 4 == 0) && !(year % 100 == 0)
    # year is divisible by 4 AND NOT divisible by 100, it's a leap year
    puts year.to_s
  end
  year = year + 1
    
end
