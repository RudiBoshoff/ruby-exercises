puts "What is the difference between a hash and an array?"
puts "Arrays store data in an ordered list which are numbered."
puts "This numbering starts at 0 and references the data."
puts "An example of an Array is:"
puts
puts "personArray ="

personArray = []
#personArray = Array.new
puts personArray = ["Rudi", "Boshoff", "male", 25]
puts "If I wanted the gender of the person, I would need to remember the slot."
puts "index, or number, in this case 2."
puts 'personArray[2]'
puts personArray[2]

puts
puts

puts "this is much less convienient than a hash which stores data along side a"
puts " key of any object type such as:"
puts
puts "personHash ="
personHash = {}
#personHash = Hash.new
puts personHash = {"name" => "Rudi","Surname" => "Boshoff","gender" => "male","age" => 25}
puts "If I wanted the gender of the person now, I simply call the data using"
puts "the allocated slot name."
puts 'personHash["gender"]'
puts personHash["gender"]
