line_width = 65
table_of_contents = [
                      ['Getting Started', '1'], 
                      ['Numbers', '9'], 
                      ['Letters', '13'],
                      ['Words', '110']
                    ]

puts('Table of Contents'.center(line_width/2))
puts('')
puts('')

chapter_number = 0

table_of_contents.each do |chapter|
  chapter_number = chapter_number + 1
  puts(('Chapter ' + chapter_number.to_s + ':  ' + chapter[0]).ljust(line_width/2) +('page  ' + chapter[1]).rjust(line_width/2 - 4 + chapter[1].length))
  
end
