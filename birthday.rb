puts "When were you born?"
puts "Year?"
birth_year = gets.chomp
puts "Month?"
birth_month = gets.chomp
puts "Day?"
birth_day = gets.chomp

time = Time.new
day = time.day
month = time.month
year = time.year

birth_date = Time.mktime(birth_year,birth_month,birth_day)
puts "Your birthdate is: #{birth_date}"
puts


def validityTest(birth_date, time)
  if birth_date.to_f > time.to_f
    puts "You aren't born yet"
    exit
  end
end

validityTest(birth_date, time)

age = year.to_f - birth_year.to_f

#should use elseif for the if statments that follow but it wasn't working
if month.to_f < birth_month.to_f
  age -= 1
end

if month.to_f == birth_month.to_f && day.to_f < birth_day.to_f
  age -= 1
end

if month.to_f == birth_month.to_f && day.to_f == birth_day.to_f
  puts "Congratulations! It\'s your birthday today!"
end

puts "You are #{age.to_i} years old"

age.to_i.times do
  puts"You got Spanked!"
end
