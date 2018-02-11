def do_self_importantly(some_proc)
  puts "EVERYBODY WAIT! I'm doing something here."
  some_proc.call
  puts "Ok, I'm done now. As you were."
end

say_hello = Proc.new do
  puts 'hello'
end

say_goodbye = Proc.new do
  puts 'goodbye'
end

do_self_importantly(say_hello)
puts
do_self_importantly(say_goodbye)
puts