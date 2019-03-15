class ConnectFour
  def initialize
    @player1 = "\u26AA" # white
    @player2 = "\u26AB" # black
    @moves = 0
    @game_over = false
    @turn = @player2
    @win = false
    # TODO: random player to start
  end

  def welcome_message
    "To win Connect Four you must be the first player to get four of your colored checkers in a row either horizontally, vertically or diagonally.

    Player 1 is : #{@player1}
    Player 2 is : #{@player2}
    "
  end

  def generate_board
    @blank = "\u26F6 "
    @board = Array.new(6) { Array.new(7, @blank.force_encoding('utf-8')) }
  end

  def display_board(board)
    width = board.flatten.max.to_s.size
    puts board.map { |a| a.map { |i| ' ' + i.to_s + ' ' }.join }
    puts "\n"
    labels = %w[A B C D E F G]
    puts labels.map { |i| ' ' + i.to_s + ' '.rjust(2) }.join
  end

  def clear_display
    system 'clear'
    puts "\n"
  end

  def set_player_turn
    @turn = @turn == @player1 ? @player2 : @player1
  end

  def player_move
    # accepts a letter between a - g
    @input = gets.chomp.upcase.chars.first
    puts "\n"
  end

  def validate_move
    @valid = false
    until @input =~ /[A-G]/
      puts 'Invalid Input. Please enter a letter between A and G'
      player_move
    end

    @valid = true

    if @valid
      case @input
      when 'A'
        col = 0
      when 'B'
        col = 1
      when 'C'
        col = 2
      when 'D'
        col = 3
      when 'E'
        col = 4
      when 'F'
        col = 5
      when 'G'
        col = 6
      end

      #place pieces at bottom row
      row = 5

      until @board[row][col] == @blank
        row -= 1

        # top of board reached
        if row < 0
            # ensure turn stays same to prevent overwriting pieces
            set_player_turn
            # kill the loop when row is out of bounds
            break
        end
      end

      # only accept moves inside the board boundaries
      if row > -1
        place_piece(row, col)
        @moves += 1
      end
    end
  end

  def place_piece(row, col)
    @board[row][col] = @turn == @player1 ? @player1 : @player2
  end

  def board_full?
    if @moves == 6*7
      true
    else
      false
    end
  end

  def win?
    # horizontal
    row = 0
    while row < 5
      for k in 0..3
        unless @board[row][k] == @blank
          if @board[row][k] == @board[row][k+1]
            if @board[row][k+1] == @board[row][k+2]
              if @board[row][k+2] == @board[row][k+3]
                return @win = true
              end
            end
          end
        end
      end
      row += 1
    end

    # vertical
    col = 0
    while col < 6
      for k in 0..2
        unless @board[k][col] == @blank
          if @board[k][col] == @board[k+1][col]
            if @board[k+1][col] == @board[k+2][col]
              if @board[k+2][col] == @board[k+3][col]
                return @win = true
              end
            end
          end
        end
      end
      col += 1
    end
  end

  def game_start
    puts welcome_message
    generate_board
    display_board(@board)
    until @game_over
      set_player_turn
      puts "It is #{@turn.force_encoding('utf-8')}'s turn'"
      player_move
      validate_move
      clear_display
      puts @win
      puts welcome_message
      display_board(@board)
      if board_full? || win?
        @game_over = true
      end
    end
  end

  def game_restart
    puts "Would you like to restart? Y/N"
    input = gets.chomp
    if input.upcase.chars.first =~ /[Y]/
      puts "game restarting . . ."
      sleep(3)
      clear_display
      initialize
      game_start
    else
      exit
    end
  end
end

game = ConnectFour.new
game.game_start
game.game_restart
