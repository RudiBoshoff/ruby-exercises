class Die
  def initialize
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

  def cheat
    number = 0
    while number.to_i > 6 || number.to_i < 1 do
      puts "enter a number between 1 and 6"
      number = gets.chomp.to_i
    end
    @numberShowing = number
  end

end

die = Die.new
puts die.showing #calling showing before rolling requires initialize method
puts die.roll    #rolls the die
puts die.showing #shows the value on the die after rolling
die.cheat        #sets the side of the die
puts die.showing #shows the new set value
