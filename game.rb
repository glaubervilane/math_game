require_relative 'player'
require_relative 'question'

class Game
  attr_reader :players

  def initialize
    @players = [Player.new("Player 1"), Player.new("Player 2")]
    @current_player = @players[0]
    @question = Question.new
    @game_over = false
  end  

  def start
    until @game_over
      play_turn
      switch_turn
  
      if @players.any? { |player| player.lives <= 0 }
        @game_over = true
      end
    end
    announce_winner
  end  

  private

  def play_turn
    @question.generate
  
    puts "#{@current_player.name}: #{@question.text}" if @current_player.is_a?(Player)
    player_answer = gets.chomp.to_i
  
    if player_answer == @question.answer
      puts "YES! You are correct."
      @current_player.increase_score
    else
      puts "Seriously? No!"
      @current_player.decrement_lives
    end
  
    display_scores
    puts "------ NEW TURN ------"
    
      # Switch players for the next turn
      def switch_players
        @current_player = @players.rotate!.first
      end    
  end  
  
  def switch_turn
    @current_player = (@current_player == players[0]) ? players[1] : players[0]
  end

  def display_scores
    players.each do |player|
      puts "#{player.name}: #{player.lives}/ 3"
    end
  end

  def announce_winner
    winner = players.find { |player| player.lives > 0 }
  
    winner
      puts "#{winner.name} wins with a score of #{winner.lives}/3"  
      puts "------ GAME OVER ------ Goodbye!"
  end  
   
end