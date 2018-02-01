# Sets the working directory
Dir.chdir '~/Pictures/PictureInbox'

# find all the pictures we need to move
pic_names = Dir['~/Pictures/Import/**/*.jpg']
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files: "
# this will be our counter. We'll start at 1 today,
# though normally I like to count from 0
pic_number = 1
pic_names.each do |name|
  print '.'
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end
  if !File.exist? new_name
    File.rename name, new_name
    pic_number = pic_number + 1
  else
    puts "ERROR: file #{name} cannot be renamed to #{new_name} because #{new_name} already exists."
    puts "exiting after renaming #{pic number - 1} files."
    exit
  end    
end

puts # this moves us off the progress bar line
puts 'Done, cutie!'