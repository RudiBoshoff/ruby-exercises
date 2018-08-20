# If we list all the natural numbers below 10 that are multiples
# of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
num = 1
numArray = []
sum = 0

while num < 10 do
  if num%3==0 || num%5==0
    numArray.push(num)
  end

  num = num + 1
end

numArray.each do |number|
  sum = sum + number
end

puts "the sum of the numbers that are multiples of 3 and 5 is: #{sum}"
puts "the numbers that were divisible are listed below:"
puts numArray
