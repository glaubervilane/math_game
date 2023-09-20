class Question
  attr_reader :text, :answer

  def initialize
    generate
  end

  def generate
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @text = "What does #{@num1} plus #{@num2} equal?"
    @answer = @num1 + @num2
  end
end