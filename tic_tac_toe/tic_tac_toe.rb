class TicTacToe
  PLAYER1 = 'X'.freeze
  PLAYER2 = 'O'.freeze

  def initialize(player1 = 'Player 1', player2 = 'Player 2')
    @player1_name = player1
    @player2_name = player2
    @board = (1..9).to_a
    @player1_turn = true
    @turn_count = 0
    @three_in_row = false
    @valid = true
  end

  # STARTS GAME
  def play_game
    show_board
    while @turn_count < 9 && !@three_in_row
      determine_turn
      player_move
      move_valid?
      if @valid
        set_board_position
        increase_turn
        win?
        toggle_turn
      end
      show_board
    end
    game_results
    play_again?
    @restart ? restart_game : end_game
  end

  private

  # DETERMINES WHO's TURN IT IS
  def determine_turn
    @player = if @player1_turn
                PLAYER1
              else
                PLAYER2
              end
    puts "It is #{@player}'s turn"
  end

  # PLAYER SELECTS POSITION OF PIECE
  def player_move
    puts "#{@player} enter your chosen location:"
    @position = gets.chomp.to_i
  end

  # DETERMINES IF MOVE IS VALID
  def move_valid?
    if @board[@position - 1] == PLAYER1 || @board[@position - 1] == PLAYER2
      @valid = false
    elsif @position.to_i.between?(1, 9)
      @valid = true
    else
      @valid = false
    end
  end

  # PLACES PIECE ON BOARD IN SELCETED POSITION
  def set_board_position
    @board[@position - 1] = @player
  end

  # USED TO DETERMINE IF BOARD IS FULL
  def increase_turn
    @turn_count +=  1
  end

  # DETERMINE IF WIN CONDITION MET: True > End Game
  def win?
    if @board[0] == @player && @board[1] == @player && @board[2] == @player
      @three_in_row = true
    elsif @board[3] == @player && @board[4] == @player && @board[5] == @player
      @three_in_row = true
    elsif @board[6] == @player && @board[7] == @player && @board[8] == @player
      @three_in_row = true
    elsif @board[0] == @player && @board[3] == @player && @board[6] == @player
      @three_in_row = true
    elsif @board[1] == @player && @board[4] == @player && @board[7] == @player
      @three_in_row = true
    elsif @board[2] == @player && @board[5] == @player && @board[8] == @player
      @three_in_row = true
    elsif @board[0] == @player && @board[4] == @player && @board[8] == @player
      @three_in_row = true
    elsif @board[2] == @player && @board[4] == @player && @board[6] == @player
      @three_in_row = true
    end
  end

  # AFTER EACH VALID MOVE IT BECOMES THE NEXT PLAYER'S MOVE
  def toggle_turn
    @player1_turn = !@player1_turn
  end

  # SHOWS BOARD
  def show_board
    clear_interface
    puts "#{@player1_name} is #{PLAYER1} and #{@player2_name} is #{PLAYER2}"
    puts 'Choose your positions using the numbers on the board below'
    puts ''
    puts "\t|#{@board[0]}\t#{@board[1]}\t#{@board[2]}|"
    puts "\t|#{@board[3]}\t#{@board[4]}\t#{@board[5]}|"
    puts "\t|#{@board[6]}\t#{@board[7]}\t#{@board[8]}|"
    puts ''
    invalid if @valid == false
  end

  # CLEARS INTERFACE TO MAINTAIN BOARD POSITION
  def clear_interface
    system 'clear'
    system 'clc'
  end

  # PROMPTS USER IF INVALID MOVE
  def invalid
    puts 'INVALID entry, Enter a new VALID position'
  end

  # DETERMINE WHO THE WINNER IS
  def game_results
    if @three_in_row
      puts "The winner is #{@player}!!"
    else
      puts 'Draw!!!'
    end
  end

  # PROMPTS TO RESTART GAME
  def play_again?
    puts 'Would you like to play again?'
    puts 'Y/N?'
    response = gets.chomp
    if response.upcase == 'Y'
      @restart = true
    else
      @restart = false
    end
  end

  # RESTARTS GAME
  def restart_game
    initialize
    play_game
  end

  def end_game
    puts 'Thank you for playing.'
  end
end

puts 'Welcome to TIC TAC TOE'
a = TicTacToe.new
a.play_game
