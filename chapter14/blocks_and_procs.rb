# lets take a look at this example from the book
toast = Proc.new do
  puts 'Cheers!'
end

#next example has a parameter
do_you_like = Proc.new do |good_stuff|
  
  puts "I *really* like #{good_stuff}!"  
end

do_you_like.call('chocolate')
do_you_like.call('Ruby')

toast.call
toast.call
toast.call

