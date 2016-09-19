class Brain

  def initialize
    @scanner = Scanner::Console.new
    @buzzer = Buzzer.new(16)
    @left = Wheel.new(20)
    @right = Wheel.new(21)
  end

  def process
    state = @scanner.scan
    @buzzer.set(state[:buzzer])
    @left.set(state[:left])
    @right.set(state[:right])
  end

end
