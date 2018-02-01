alpha = Array.new + [12345] # array addition
beta = String.new + 'hello' # string addiion
karma = Time.new            # current data and time
puts "alpha = #{alpha}"
puts "beta = #{beta}"
puts "karma = #{karma}"

time = Time.new # the moment we ran this code
time2 = time + 60 # one minute later
puts time
puts time2

puts Time.local(2000,1,1)
puts Time.local(1976,8,3,13,31)
puts Time.gm(1955,11,5) # Back to the future reference! had to google it

birth_time = Time.local(1977,8,3,22,30)
puts "I was born #{birth_time}"
puts "One billion seconds from that is #{birth_time + 10**9}"
puts "Oops I missed it"
