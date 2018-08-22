class Person
  @@people_count=0
  @@people = []
  # create an empty array

  def initialize(name, age, profession)
    @name = name
    @age = age
    @profession = profession
    @@people_count += 1
    @@people << name
    # add people to array
  end

  def self.number_of_instances
    return @@people_count
  end

  # This is a class method. Syntax: ClassName.method_name
  # SHould rather use self instead of ClassName but this is just an example
  def Person.people_names
    puts
    puts @@people
  end

=begin
  This is an instance method, that only applies to whatever instance we
  call it on and not to the class
=end
  def greeting
    puts "Hello, my name is #{@name}, I’m #{@age} years old and I work as a #{@profession}!"
  end

end

eric = Person.new("Eric Smit", 25, "Doctor")
rudi = Person.new("Rudi Boshoff", 25, "Web developer")
batman = Person.new("Bruce Wayne",34, "Superhero")
bill_gates = Person.new("Bill Gates", 45, "Software Engineer")

# we're printing the value of the instance variable for the class (class variable)
puts "There are #{Person.number_of_instances} number of instances in the class Person"

puts "The names of all the people/ instances of the class Person are: "
# We’re printing all the names of every instance of the class People
puts Person.people_names

# This would work, because Eric is an actual instance of the class Person
puts eric.greeting


# This would not work because Person doesn’t exist, it’s just a class
puts "Calling a method on a class when it is not a Class method will result in failure"
puts Person.greeting
