page = ["page 7", "page 72", "page 118"]
chapter = ["Chapter 1:", "Chapter 2:", "Chapter 3:"]
heading = ["  Numbers","  Letters","  Variables"]

line_width = 50
i = 0

puts "TABLE of CONTENTS \n".center(line_width)
3.times do
  puts (chapter[i] + heading[i]).ljust(line_width/2) + page[i].rjust(line_width/2)
  i = i + 1
end
