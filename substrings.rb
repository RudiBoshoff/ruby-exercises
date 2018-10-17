def substrings(sentence, dictionary)
  puts "The inputed string was: '#{sentence}'"
  sentence = sentence.downcase
  occurances = Hash.new(0)
  puts 'The dictionary contains the following words:'
  dictionary.each do |item|
    item.downcase.gsub!(/[^a-z]/, '')
    puts item
    occurances[item] = 0
  end

  # ASSIGNMENT AND OCCURENCE
  occurances.each do |key, _value|
    occurances[key] = sentence.scan(key).size
  end
  puts ''
  puts 'The following words matched the dictionary words:'
  # DISPLAY
  occurances.each do |key, value|
    print "'#{key}': #{value}, " if value > 0
  end
  puts ''
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
substrings("Howdy partner, sit down! How's it going?", dictionary)
