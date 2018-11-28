class Viking
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

  # getter method
  def health
    @health
  end

  # Setter method
  def health=(new_health)
    @health = new_health
  end
end


puts oleg = Viking.new("Oleg", 20, 100, 8)
puts lars = Viking.new("Lars", 35, 300, 15)
puts lars.attack(oleg)
puts oleg.health
