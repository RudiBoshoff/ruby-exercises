class OrangeTree

  def initialize
    puts "You planted an orange tree."
    puts "A few weeks goes by..."
    puts "...your orange tree is getting quite big."
    puts "You make sure your orange tree is watered often."
    @age = 0
    @height = 30
    @fruit = 0
  end

  def oneYearPasses
    @age = @age + 1
    @height = @height + 50

    if alive?
      puts "Another year goes by..."
      puts "...but your orange tree has run its course and has passed away."
      exit
    end

    puts "One year goes by. Your orange tree is growing nicely."

    if fruit?
      @fruit = 10
      puts "Your orange tree has produced " + @fruit.to_s + " oranges."
    end


  end

  def height
    puts "Your orange tree is now " + @height.to_s + " cm tall."
  end

  def pick
    @fruit = @fruit - 1
    puts "You pick an orange, peel back the skin. You sink your teeth into the flesh. WOW! It is delicious!"
  end

  private

  def alive?
    @age >= 5
  end

  def fruit?
    @age >= 2
  end
end

orange = OrangeTree.new
orange.height
orange.oneYearPasses
orange.height
orange.oneYearPasses
orange.pick
orange.oneYearPasses
orange.height
orange.oneYearPasses
orange.height
orange.oneYearPasses
