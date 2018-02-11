# This next program is meant to chime like a clock for each hour of the day
# Pine says something about Time.new.hour returning 0 to 23. I'm sure this is true, but 
def do_per_clock_hour &block
  puts Time.new
  hours = Time.new.hour 
  if hours > 12
    hours -= 12
  elsif hours == 0
    hours = 12 # I want 12 bongs from 00:00 - 00:59, and from 12:00 - 12:69
  end
  
  hours.times do
    block.call
  end
end

do_per_clock_hour do
  puts 'Bong!' # Pine went with Dong, but I like bongs
end
