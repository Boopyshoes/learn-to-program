line_width = 50
chapter1_title = 'Getting Started'
chapter2_title = 'Numbers'
chapter3_title = 'Letters'

puts('Table of Contents'.center(line_width/2))
puts('')
puts('')
puts(('Chapter 1:  ' + chapter1_title).ljust(line_width/2) +'page   1  '.rjust(line_width/2))
puts(('Chapter 2:  ' + chapter2_title).ljust(line_width/2) + 'page   9'.rjust(line_width/2))
puts(('Chapter 3:  ' + chapter3_title).ljust(line_width/2) + 'page  13'.rjust(line_width/2))

