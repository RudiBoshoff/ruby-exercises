class ConnectFour
  def initialize
    @player1 = "\u26AB" # white
    @player2 = "\u26AA" # black

    @game_over = false
    @turn = @player1
    #TODO: random player to start
  end

  def welcome_message
    "To win Connect Four you must be the first player to get four of your colored checkers in a row either horizontally, vertically or diagonally.\n\n"
  end

  def generate_board
    @board = []
    temp = []
    blank = "\u26F6 "
    7.times do
      temp << blank.force_encoding('utf-8')
    end

    6.times do
      @board << temp
    end
  end

  def display_board(board)
    width = board.flatten.max.to_s.size+2
    puts board.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
    puts "\n"
    labels = ["A","B","C","D","E","F","G"]
    puts labels.map{ |i| i.to_s.rjust(width) }.join
  end

  def clear_display
    system "clear"
    puts "\n\n"
  end

  def set_player_turn
    @turn == @player1 ? @turn = @player2 : @turn = @player1
 end

 def player_move
   #accepts a letter between a - g
   @input = gets.chomp.upcase
   puts "\n"
 end

 def validate_move
   @valid = false
   until @input =~ /[A-G]/
     puts "Invalid Input. Please enter a letter between A and G"
     player_move
   end
   # validate over writing / occupied block
   @valid = true
 end

 def place_piece
   if @valid
     case @input
     when "A"
       col = 0
     when "B"
       col = 1
     when "C"
       col = 2
     when "D"
       col = 3
     when "E"
       col = 4
     when "F"
       col = 5
     when "G"
       col = 6
     end
     row = 5
     @turn == @player1? @board[row][col] = @player1 : @board[row][col] = @player2
   end
end

 def game_start
   puts welcome_message
   generate_board
   display_board(@board)
   set_player_turn
   puts "It is #{@turn.force_encoding('utf-8')}'s turn'"
   player_move
   validate_move
   place_piece
   clear_display
   display_board(@board)
 end
end


game = ConnectFour.new
game.game_start
