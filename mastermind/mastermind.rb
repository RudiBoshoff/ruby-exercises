# Rudi Boshoff
require './colorize.rb'
class Game
  def initialize
    initialize_default_variables
  end

  def game_run
    while @restart
      initialize_default_variables
      game_start
      restart_prompt
      restart_game?
    end
  end

  private

  def initialize_default_variables
    @rounds = 4 # default = 4
    @current_round = 0
    @player_combination = ''
    @combination_size = 4 # default = 4
    @max_range = 6 # must be between 2 and 9
    @game_over = false
    @valid = false
    @restart = true
  end

  def game_start
    display_rules
    generate_combination
    until @game_over
      until @valid
        player_input
        valid_input?
      end
      analyze
      increase_round
      game_over?
    end
    determine_winner
  end

  def display_rules
    puts 'HOW TO PLAY MASTERMIND'.cyan
    puts ''
    sleep 0.5
    puts '1 - You have to break a secret code in order to win the game.'
    sleep 0.5
    puts ''
    puts "2 - You have #{@rounds} rounds to crack the code. In each round you will input what you think is the secret code."
    puts ''
    sleep 0.5
    puts '3 - After submitting your code. The computer will try to help you to crack the code by giving hints as to correct digits, incorrect digits and correct digits that are in the incorrect position.'
    puts ''
    sleep 0.5
    puts 'HINTS'.cyan
    puts ''
    sleep 0.5
    puts '>>> If you get a digit absolutely correct, the digit will be coloured ' + 'green'.green + '.'
    sleep 0.5
    puts ''
    puts '>>> If you get a digit correct but in the wrong position, the digit will be coloured white.'
    sleep 0.5
    puts ''
    puts '>>> If you get the digit wrong, the digit will be coloured ' + 'red'.red + '.'
    sleep 0.5
    puts ''
    puts 'For Example'.cyan
    sleep 0.5
    puts 'If the secret code is:'
    puts '1234'
    puts 'and your guess was:'
    puts '1524'
    puts 'you will see the following result:'
    print '1'.green
    sleep 0.5
    print '5'.red
    sleep 0.5
    print '2'.white
    sleep 0.5
    print '4'.green
    puts ''
    puts ''
    sleep 1
    puts 'LET THE GAME BEGIN'.yellow
    puts ''
    puts "Each digit should be between 1 and #{@max_range}".yellow
    sleep 0.5
    puts "You have 4 rounds in which to guess the correct #{@combination_size} digit combination".cyan
  end

  def generate_combination
    @combination = []
    @combination_size.times do
      @combination.push(1 + rand(@max_range)).to_s
    end
    # puts "the secret combination is: #{@combination.join("")}"
    @combination = @combination.join('')
  end

  def player_input
    puts 'Enter your combination:'
    @player_combination = gets.chomp.to_i.to_s
  end

  def valid_input?
    if @player_combination =~ /^[1-#{@max_range}]{#{@combination_size}}$/
      @valid = true
    else
      @valid = false
      puts ''
      puts "Please enter a valid #{@combination_size} digit code with each digit between 1 and #{@max_range}".red
    end
  end

  def analyze
    index = 0
    puts 'Round results:'
    print ' '
    @combination_size.times do
      if @combination[index] == @player_combination[index]
        print @player_combination[index].green
      elsif @combination.include? @player_combination[index]
        print @player_combination[index].white
      else
        print @player_combination[index].red
      end
      index += 1
    end
    puts ''
  end

  def increase_round
    @current_round += 1
    @valid = false
    if @current_round < 4
      puts ''
      puts "You have #{@rounds - @current_round} rounds in which to guess the correct #{@combination_size} digit combination".cyan
    end
  end

  def game_over?
    @winner = @combination == @player_combination
    @game_over = if @winner || @current_round >= 4
                   true
                 else
                   false
                 end
  end

  def determine_winner
    if @winner
      puts ''
      puts ''
      puts 'Good Job! You cracked the code!'.green
    else
      puts ''
      puts ''
      puts 'You Lose!'.red
    end
  end

  def restart_prompt
    puts 'Would you like to restart the game?'
    puts 'Enter Y or N'
    @response = gets.chomp.upcase
  end

  def restart_game?
    @restart = @response == 'Y'
  end
end

game = Game.new
game.game_run
