class TicTacToe
  PLAYER1 = 'X'.freeze
  PLAYER2 = 'O'.freeze

  def initialize(player1 = 'Player 1', player2 = 'Player 2')
    @player1_name = player1
    @player2_name = player2
    @board = (1..9).to_a
    @player1_turn = true
    @turn_count = 0
    @game_finished = false
    clear
    @valid = true
    show
  end

  # CLEARS INTERFACE
  def clear
    system 'clear'
    system 'clc'
  end

  # SHOWS BOARD
  def show
    clear
    puts "#{@player1_name} is #{PLAYER1} and #{@player2_name} is #{PLAYER2}"
    puts 'Choose your positions using the numbers on the board below'
    puts ''
    puts "\t|#{@board[0]}\t#{@board[1]}\t#{@board[2]}|"
    puts "\t|#{@board[3]}\t#{@board[4]}\t#{@board[5]}|"
    puts "\t|#{@board[6]}\t#{@board[7]}\t#{@board[8]}|"
    puts ''

    puts 'INVALID entry, Enter a new VALID position' if @valid == false
  end

  # DETERMINES WHO's TURN IT IS
  def turn
    @player = if @player1_turn
                PLAYER1
              else
                PLAYER2
              end
    puts "It is #{@player}'s turn"
  end

  # PLACES X OR O ON BOARD
  def play
    while @turn_count < 9 && !@game_finished
      turn
      puts "#{@player} enter your chosen location:"
      @position = gets.chomp.to_i
      validity
      show
    end
    results
  end

  # DETERMINES IF INPUT IS VALID
  def validity
    if @board[@position - 1] == PLAYER1 || @board[@position - 1] == PLAYER2
      @valid = false
    elsif @position.to_i.between?(1, 9)
      @board[@position - 1] = @player
      @turn_count += 1
      @valid = true
      win?
      @player1_turn = !@player1_turn
    else
      @valid = false
    end
  end

  # DETERMINE IF WIN CONDITION MET
  def win?
    if @board[0] == @player && @board[1] == @player && @board[2] == @player
      @game_finished = true
    elsif @board[3] == @player && @board[4] == @player && @board[5] == @player
      @game_finished = true
    elsif @board[6] == @player && @board[7] == @player && @board[8] == @player
      @game_finished = true
    elsif @board[0] == @player && @board[3] == @player && @board[6] == @player
      @game_finished = true
    elsif @board[1] == @player && @board[4] == @player && @board[7] == @player
      @game_finished = true
    elsif @board[2] == @player && @board[5] == @player && @board[8] == @player
      @game_finished = true
    elsif @board[0] == @player && @board[4] == @player && @board[8] == @player
      @game_finished = true
    elsif @board[2] == @player && @board[4] == @player && @board[6] == @player
      @game_finished = true
    end
  end

  # DETERMINE WHO THE WINNER IS
  def results
    if @game_finished
      puts "The winner is #{@player}!!"
    else
      puts 'Draw!!!'
    end
  end
end

puts 'Welcome to TIC TAC TOE'
a = TicTacToe.new
a.play
