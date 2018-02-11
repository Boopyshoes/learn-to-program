# This program is used to tme blocks.
# The idea is to find bits of code in a program that are inefficient so they can be fixed

# Here goes!
# After this it's the exercises!

def profile block_description, &block
  start_time = Time.now
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds"
end

profile '25,000 doublings(addition)' do
    number = 1
    25_000.times do
      number = number + number
    end
    puts "#{number.to_s.length} digits" # puts the number of digits in our number
  end

profile'25,000 doublings(multiplication)' do
          number = 1
          25_000.times do
            number = number * 2
          end
          puts "#{number.to_s.length} digits" # puts the number of digits in our number
        end

profile 'count to a million (written out addition)' do
          number = 0
          1_000_000.times do
            number = number + 1
          end
        end

profile 'count to a million (+= operator)' do
          number = 0
          1_000_000.times do
            number += 1
          end
        end