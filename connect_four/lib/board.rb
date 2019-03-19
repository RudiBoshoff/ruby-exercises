class Board
  attr_accessor :grid
  attr_reader :blank

  def initialize
    @blank = "\u26F6 "
    @grid = Array.new(6) { Array.new(7, @blank.force_encoding('utf-8')) }
  end

  def display
    width = @grid.flatten.max.to_s.size
    puts @grid.map { |a| a.map { |i| ' ' + i.to_s + ' ' }.join }
    puts "\n"
    labels = %w[A B C D E F G]
    puts labels.map { |i| ' ' + i.to_s + ' '.rjust(2) }.join
  end
end
