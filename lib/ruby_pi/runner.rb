class Runner

  def initialize
    @brain = Brain.new
  end

  def run
    while(true)
      @brain.process
      sleep(0.01)
    end
  end
end
