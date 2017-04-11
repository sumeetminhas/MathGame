class Game

  def initialize
    @players = [
      Player.new(1),
      Player.new(2)
    ]
    @current_player = @players.first
    @question = Question.new
  end

  def intro
    puts = "\n====================="
    puts += "\n......Welcome......"
    puts += "\n===================="
  end

  def inform(exclaim)
    "\n#{exclaim}!\nThe answer is #{@question.answer}\n"
  end

  def warning
    puts = "\n"
    @players.each { |player| puts += "Player #{player.id} => #{player.lives_remaining}\n"}
    puts
  end

  def someone_won
    winner = other_player
    puts = "Player #{winner.id} wins. You have #{winner.lives_remaining}"
    puts += "\n=====GAME OVER ====="
  end

  def other_player
    @players.find { |player| player.id != @current_player.id}
  end

  def new_turn
    @current_player = other_player
    "====NEW TURN ====\n"
  end

  def game
    loop do
      puts @current_player.announce

      puts @question.ask
      player_answer = gets.to_i

      if player_answer == @question.answer
        puts inform("Correct")
      else
        puts inform("Incorrect")
        @current_player.subtract_life
        break if @current_player.died?
      end

      puts warning

      puts "\nPress ENTER to continue"
      at_which_point = gets

      puts new_turn
    end
  end

  def play
    puts intro
    puts warning

    game

    puts warning
    puts someone_won
  end
end
