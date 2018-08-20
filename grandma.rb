# logic
# if input is upcase
# then grandma shouts "no not since"
# random number between 1930 and 1950 inclusive
# else grandma shouts "SPEAK UP SONNY"

puts "HELLO SONNY!"
response = gets.chomp
if response == response.upcase
  number = 0
  while number < 30
    number = rand(51)
  end
  puts "NO, NOT SINCE 19" + number.to_s + "!"
else
  puts "HUH?! SPEAK UP, SONNY!"
end
