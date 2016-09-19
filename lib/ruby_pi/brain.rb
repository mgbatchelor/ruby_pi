class Brain

  def initialize
    @stack = []
  end

  def ingest(scan)
    return if @stack.size > 4
    # Decide what to do based on current stack, and new data
    @stack = [State.new(1, scan)]
    # case scan[:value]
    # when 0
    #   @stack << Direction.left(rand(5))
    # when 1
    #   @stack << Direction.right(rand(5))
    # when 2
    #   @stack << Direction.straight(rand(5))
    # when 3
    #   @stack << Direction.stop(1)
    # end
  end

  def state(now)
    state = @stack.first
    if state && state.until_timestamp >= now
      yield state
    else
      @stack.shift # Remove first state because its past
    end
  end

  private

  class Direction

    def self.straight(duration)
      State.new(duration, {left: 1, right: 1})
    end

    def self.left(duration)
      State.new(duration, {left: 1, right: 0})
    end

    def self.right(duration)
      State.new(duration, {left: 0, right: 1})
    end

    def self.stop(duration)
      State.new(duration, {left: 0, right: 0})
    end

  end

  class State
    attr_accessor :until_timestamp, :states

    def initialize(duration, states={})
      @until_timestamp = (Time.now + duration).to_f
      @states = states
    end
  end

end
