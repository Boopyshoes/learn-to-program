def log block_name, &block
  puts "started #{block_name}"
  block.call
  puts "#{block_name} is finished"
end

log 'thing 1' do
  puts "I'm a crazy little red suited bundle of energy!"
  log 'thing 2' do
    puts "I'm just as crazy!"
  end
end

# CHAPTER 14 IS FINISHED!!!
That. Is. So. Rad.
I actually need lunch now. See you soon!