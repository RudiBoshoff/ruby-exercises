class Viking
  attr_accessor :name, :age, :health, :strength
  # accessor gives read and write privileges
  # reader gives read privileges
  # writer gives write privileges
  def initialize(name, age, health, strength)
    @name = name
    @age = age
    @health = health
    @strength = strength
  end

  def attack(enemy)
    # code to attack enemy
    "Attack!"
  end
end

puts oleg = Viking.new("Oleg", 20, 100, 8)
puts lars = Viking.new("Lars", 35, 300, 15)
puts lars.attack(oleg)
puts oleg.health
