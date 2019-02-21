class CaeserCipher
  def caeser_cipher(text, shift)
    characters = text.split('').map do |letter|
      if letter.between?('A', 'Z')
        index = letter.ord
        $character = index + shift
        $character = range(65, 90, $character)
        letter = $character.chr
      elsif letter.between?('a', 'z')
        index = letter.ord
        $character = index + shift
        $character = range(97, 122, $character)
        letter = $character.chr
      else
        letter
      end
    end
    # puts "'#{text}' has been shifted by #{shift} units and is now '#{characters.join}'"
    characters.join
  end
private
  def range(min, max, item)
    item -= 26 while item > max

    item += 26 while item < min

    item
  end
end
