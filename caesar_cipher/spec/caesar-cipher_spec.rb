require './caeser_cipher'

describe CaeserCipher do
  describe "#caeser_cipher" do
    it "returns a shifted lowercase string" do
      cipher = CaeserCipher.new
      expect(cipher.caeser_cipher("abc", 2)).to eql("cde")
    end

    it "returns a shifted uppercase string" do
      cipher = CaeserCipher.new
      expect(cipher.caeser_cipher("ABC", 2)).to eql("CDE")
    end

    it "returns a negatively shifted string (reverse direction)" do
      cipher = CaeserCipher.new
      expect(cipher.caeser_cipher("abc", -1)).to eql("zab")
    end

    it "returns a shifted string ignoring punctuation" do
      cipher = CaeserCipher.new
      expect(cipher.caeser_cipher("Jerry's my name, what's your name?", 5)).to eql("Ojwwd'x rd sfrj, bmfy'x dtzw sfrj?")
    end

    it "returns a shifted string with numbers" do
      cipher = CaeserCipher.new
      expect(cipher.caeser_cipher("My contact number is: 012 345 6789", 8)).to eql("Ug kwvbikb vcujmz qa: 012 345 6789")
    end
  end
end
