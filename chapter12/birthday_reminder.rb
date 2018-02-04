#The idea here is to create a list of people's names and birthdays so that I can read that file in,
# take an input from the user (name of a person), then tell the user when that person's next
# birthday is and how old they are.


# Get input from the user to find out which person's
# Birthday they want to know about
def get_birthday_name
  # Regex to ensure names include one or more words (hyphens inclusive)
  # separated by a single whitespace each
  name_regex = /([\w]+[-]?[\w]+[\s{1}])*[\w]+[-]?[\w]/i 
  puts "I can help you figure out the someone's next birthday."
  puts "Well, that is if I know them..."
  
  # ask until the name meets our format. 
  begin
    puts "Who's birthday do you want to know?"
    name = gets.chomp
    if !(name_regex.match(name).to_s == name)
      puts "#{name} doesn't look like a proper name to me. Try again."
    end
  end until name_regex.match(name).to_s == name
  name
end

# looks through a multiline string for a line starting with name, chomps it,
# and returns the stripped substring from 1 chars after the name to the end
# of the line, which should be our birthday regardless of birthday format
# Returns an empty string if no matching line is found
def find_birthday_by_name(string, name)
  birthday = '' # default returning an empty string
  string.each_line do |line|
    if line.start_with?(name + ',') # forgot about that comma to make sure we get tho whol ething
      birthday = line.chomp[name.length+1..-1].strip
      break
    end
  end
  birthday  
end

# month_to_int takes a month in the format MMM
# and returns the integer value of that month
# or 0 if an invalid month is supplied
def month_to_int (month)
  month_int = 0 # default to 0
  month_codes = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC']
  if month_codes.index(month.upcase) != nil
    month_int = month_codes.index(month.upcase) + 1
  end
  month_int 
end

def exit_with_message(message)
  puts message
  exit
end

# Returns the next time this birthday occurs as a Time object
# If today's date is passed in it returns today
# If month or day are out of range (1-12, 1-31 respectively)
# returns a nil
# month and day are assumed to be integers
def find_next_birthday(month, day)
  if ((1 <= month) && (month <= 12)) && ((1 <= day) && (day <= 31)) 
    if month == Time.now.month
      if day >= Time.now.day
        # birthday is today or later this month
        birthday_year = Time.now.year
      else 
        # next birthday is next year
        birthday_year = Time.now.year + 1
      end
    elsif month > Time.now.month
      # birthday is later this year
      birthday_year = Time.now.year
    else
      # Birthday is next year
      birthday_year = Time.now.year + 1
    end
    birthday = Time.new(birthday_year, month, day)
  else
    nil
  end
end

# Make the age an ordinal number, such a 1st, 11th, 42nd, etc
# age is a string
def age_to_ord (age)
  if age[-1] == '1' && !age.end_with?('11') 
    age_ord_num = age + 'st'
  elsif age[-1] == '2' && !age.end_with?('12')
    age_ord_num = age + 'nd'
  elsif age[-1] == '3' && !age.end_with?('13')
    age_ord_num = age + 'rd'
  else
    age_ord_num = age + 'th'
  end
end

# our program begins here
filename = 'birthdays.txt' # this is the input file
birthday_name = get_birthday_name
puts

# read the file to a string
read_str = File.read filename

birthday = find_birthday_by_name(read_str, birthday_name)
if birthday == ''
  exit_with_message("I'm sorry but I don't know #{birthday_name}'s birthday. :(")
end

month_int = month_to_int(birthday[0..2])
puts month_int
# exit the program if we don't get a good result converting the month
if month_int == 0
  exit_with_message("An unexpected error has occurred. #{birthday[0..2]} is\n"+
                    "not in the required month format of MMM")
end

# remove whitespace to account for some file line inconsistencies
birthday = birthday.gsub(/\s/, "")
birthday = birthday.gsub(/[,]/,"")
# puts birthday # Here for debugging
year = birthday[-4..-1].to_i
date = birthday[3..-5].to_i  # we have MMMD(D),YYYY. 3..-6 will return a 1 or 2 digit date

puts year
puts date

next_birthday = find_next_birthday(month_int, date)
if next_birthday == nil
  exit_with_message ("An unexpected error has occurred. \n" +
                     "Unable to calculate the next birthday for\n" +
                     "month = #{month_int}, date = #{date}.")
elsif next_birthday == Time.new(Time.now.year, Time.now.month, Time.now.day)
  birthday_ord_num = age_to_ord((next_birthday.year - year).to_s)  
  puts "It's #{birthday_name}'s birthday today!"
  puts "You should wish them a happy #{birthday_ord_num} birthday!"
else
  birthday_ord_num = age_to_ord((next_birthday.year - year).to_s)  
  puts "#{birthday_name}'s next birthday is #{next_birthday.strftime("%B %-d, %Y")}"
  puts "Make sure to wish them a happy #{birthday_ord_num} birthday when the day comes!"
end