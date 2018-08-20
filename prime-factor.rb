puts "Enter two numbers and I will tell you all the prime numbers between them."
puts "Enter your starting number"
num = gets.to_i
puts "Enter your ending number"
last = gets.to_i

while (num <= last)
  prime_flag = true

  x = 2

  while (x <= num / 2)
      if (num % x == 0)
        prime_flag = false
        break
      end
  x += 1
  end

  if prime_flag
    puts "Prime number > : " + num.to_s
  end

  num +=1
end
