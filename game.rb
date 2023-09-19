class Game

  def initialize
  @player1 = Player.new("Player 1")
  @player2 = Player.new("Player 2")
  @current_player = @player1
  end
  
  def start
    puts "Starting new game..."

    loop do
      puts "----- NEW TURN -----"

      # Ask question
      question = Question.new
      question.generate
      puts "#{@current_player.name}: #{question.prompt}"

      # Get player's answer
      answer = gets.chomp.to_i

      # Check if correct  
      if @current_player.correct_answer?(answer, question)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end

      # Switch players
      if @current_player == @player1
        @current_player = @player2 
      else
        @current_player = @player1
      end

      # Check if game over
      if @current_player.lives == 0
        puts "#{@current_player.name} is out of lives. GAME OVER!"
        puts "#{@other_player.name} wins with a score of #{@other_player.lives}/3"
        break
      end

    end
  end

end