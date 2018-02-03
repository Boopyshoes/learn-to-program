git def get_birth_year
  while true  
    puts "What year were you born in?"
    birth_year = gets.chomp
    if !(birth_year.to_i >= 1900 && birth_year.to_i <= Time.new.year)
      puts "I'm not buying #{birth_year} please enter the actual year you were born."
    else
      break 
    end
  end
  birth_year.to_i
end

def get_birth_month
  while true  
    puts "What month were you born in(1-12)?"
    birth_month = gets.chomp
    if !(birth_month.to_i >= 1 && birth_month.to_i <= 12)
      puts "please enter the month as a number 1-12"
    else
      break
    end
  end
  birth_month.to_i
end
  
def get_birth_day
  while true
    puts "On which day of the month were you born?"
    birth_day = gets.chomp
    if !(birth_day.to_i >= 1 && birth_day.to_i <= 31)
      puts "please enter the month as a number 1-31"
    else
      break
    end
  end
  birth_day.to_i
end
  
year = get_birth_year
month = get_birth_month
day = get_birth_day

if month == Time.new.month && day == Time.new.day
  puts 'Happy Birthday!'
end

years = Time.new.year - year
months = Time.new.month - month
days = Time.new.day - day

if months == 0
  if days < 0 # It's not your birthday yet
    years = years -1
  end
elsif months < 0
  years = years - 1
end

puts "Time to catch up on those birthday spankings."
puts "You're #{years} years old, so strap in!"
spank_count = 0
while spank_count < years 
  spank_count = spank_count + 1
  puts '*SPANK*'
  if spank_count < years
    puts "That's #{spank_count}. Only #{years - spank_count} left."
  else
    puts "That's #{spank_count}. We're Done!"
  end  
end