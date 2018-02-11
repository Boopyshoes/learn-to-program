# the challenge here is to create profiling that can be turned on and off with a single line of code.
# Calling this done

PROFILING_ON = false # reminds me of compiler instructions when I was writing turbo pascal back in HS

def profile description_of_block, profiling_on, &block
  # Let's just throw a guard clause on here
  if profiling_on
    start_time = Time.now
    block.call
    duration = start_time - Time.now
    puts "#{description_of_block} took #{duration} seconds to run"
  else
    block.call
  end
end

profile '25,000 doublings', PROFILING_ON do
  number = 1
  25_000.times do
    number = number + number
  end
  puts number.to_s.length
end

profile 'count to 1,000,000', PROFILING_ON do
  number = 0
  1_000_000.times do
    number += 1
  end
  puts number
end

