da_man = 'Mr. T' # love this author's sense of humor
big_T = da_man[4]
puts big_T

puts "Hello. My name is Julian"
puts "I am extremely perceptive."
puts "What's your name?"
name = gets.chomp
puts "Hi, #{name}"

if name[0].downcase == 'b'
  puts 'You have excellent taste in whiskey.'
  puts 'I can just tell.'
end

prof = 'We tore the universe a new space-hole, alright!'
puts prof[12, 8] # 8 character substring starting at character 12
puts prof[12..19] # same thing with a range
puts
def is_avi?(filename)
  filename.downcase[-4..-1] == '.avi' # grab the last 4 characters using negative numbers
end

# apparently these are some of the author's embarassing childhood home movies/pics
puts is_avi?('Dancemonkeyboy.avi')
puts is_avi?('toilet_paper_fiasco.jpg')




