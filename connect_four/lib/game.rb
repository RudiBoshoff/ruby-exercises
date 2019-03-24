require_relative 'player'
require_relative 'board'

class Game
  def initialize
    @player1 = Player.new("\u26AA") # white
    @player2 = Player.new("\u26AB") # black
    @board = Board.new
    @moves = 0
    @game_over = false
    @turn = @player1.piece
    @win = false
    # TODO: random player to start
  end

  def reset_display
    clear_display
    puts welcome_message
    @board.display
  end

  def welcome_message
    "To win Connect Four you must be the first player to get four of your colored checkers in a row either horizontally, vertically or diagonally.

    Player 1 is : #{@player1.piece}
    Player 2 is : #{@player2.piece}
    "
  end

  def clear_display
    # keeps grid in the same spot
    system 'clear'
    puts "\n"
  end

  def player_turn
    puts "It is #{@turn.force_encoding('utf-8')}'s turn'"
    input = player_input
    col = determine_col(input)

    if !column_full?(col)
      row = determine_row(col)
      place_piece(row, col)
    else
      player_turn # recursion
    end
  end

  def player_input
    # accepts a letter between a - g
    input = 'Invalid'
    until input =~ /[A-G]/
      puts 'Please enter a letter between A and G'
      input = gets.chomp.upcase.chars.first
    end
    input
  end

  def determine_col(input)
    case input
    when 'A'
      0
    when 'B'
      1
    when 'C'
      2
    when 'D'
      3
    when 'E'
      4
    when 'F'
      5
    when 'G'
      6
    end
  end

  def column_full?(col)
    if @board.grid[0][col] != @board.blank
      reset_display
      puts 'Column full. Select a different one.'
      true
    end
  end

  def determine_row(col)
    row = 5
    until row < 0
      return row if @board.grid[row][col] == @board.blank

      row -= 1
    end
  end

  def place_piece(row, col)
    @moves += 1
    @board.grid[row][col] = @turn
  end

  def game_end?
    if win?
      puts "Congrats #{@turn} is the winner"
      @game_over = true
    end

    if board_full?
      puts 'No more available spaces. It is a draw'
      @game_over = true
    end
  end

  def next_player
    @turn = @turn == @player1.piece ? @player2.piece : @player1.piece
  end

  def board_full?
    @moves == 6 * 7
  end

  def win?
    four_in_column? || four_in_row? || four_in_diagonal? if @moves > 6
  end

  def four_in_column?
    (0..2).each do |row|
      (0..6).each do |col|
        if @board.grid[row][col] == @board.grid[row + 1][col] &&
           @board.grid[row + 1][col] == @board.grid[row + 2][col] &&
           @board.grid[row + 2][col] == @board.grid[row + 3][col]
          if @board.grid[row][col] == @player1.piece
            return true
          elsif @board.grid[row][col] == @player2.piece
            return true
          end
        end
      end
    end
    false
  end

  def four_in_row?
    (0..5).each do |row|
      (0..3).each do |col|
        if @board.grid[row][col] == @board.grid[row][col + 1] &&
           @board.grid[row][col + 1] == @board.grid[row][col + 2] &&
           @board.grid[row][col + 2] == @board.grid[row][col + 3]
          if @board.grid[row][col] == @player1.piece
            return true
          elsif @board.grid[row][col] == @player2.piece
            return true
          end
        end
      end
    end
    false
  end

  def four_in_diagonal?
    (0..2).each do |row|
      (0..3).each do |col|
        if @board.grid[row][col] == @board.grid[row + 1][col + 1] &&
           @board.grid[row + 1][col + 1] == @board.grid[row + 2][col + 2] &&
           @board.grid[row + 2][col + 2] == @board.grid[row + 3][col + 3]
          if @board.grid[row][col] == @player1.piece
            return true
          elsif @board.grid[row][col] == @player2.piece
            return true
          end
        end
      end
    end

    (0..2).each do |row|
      6.downto(3).each do |col|
        if @board.grid[row][col] == @board.grid[row + 1][col - 1] &&
           @board.grid[row + 1][col - 1] == @board.grid[row + 2][col - 2] &&
           @board.grid[row + 2][col - 2] == @board.grid[row + 3][col - 3]
          if @board.grid[row][col] == @player1.piece
            return true
          elsif @board.grid[row][col] == @player2.piece
            return true
          end
        end
      end
    end
    false
  end

  def start
    reset_display
    until @game_over
      player_turn
      reset_display
      game_end?
      next_player
    end
  end
end

# game = Game.new
# game.start
