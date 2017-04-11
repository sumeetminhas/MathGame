 class Player
  attr_reader :lives
  attr_reader :id

  def initialize(id)
    @id = id
    @max_lives = 3
    @lives = @max_lives
  end

  def announce
    "Player #{@id}:"
  end

  def died?
    lives == 0
  end

  def lives_remaining
    "#{@lives}/#{@max_lives} lives remaining"
  end

  def subtract_life
    @lives -= 1;
  end

end
