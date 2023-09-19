class Game

  def initialize
  @player1 = Player.new("Player 1")
  @player2 = Player.new("Player 2")
  @current_player = @player1
  end
  
  def start
  puts "Starting new game..."
  # TODO: implement game loop
  end
  
  end