class Question
  attr_reader :answer

  def formulate
    @first_number = 1 + rand(100)
    @second_number = 1 + rand(100)
    @answer = @first_number + @second_number
  end

  def ask
    formulate
    "What does #{@first_number} plus #{@second_number} equal?"
  end

end
