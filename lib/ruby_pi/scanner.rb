module Scanner
  class Console
    require 'io/console'

    def initialize
      @left = 0
      @right = 0
      @speed = 1
      @buzzer = 0

      Thread.new do
        loop do
          case STDIN.getch
          when 'w'
            @left, @right = 1, 1
          when 'a'
            @left, @right = 1, 0
          when 'd'
            @left, @right = 0, 1
          when 's'
            @left, @right = 0, 0
          when 'z'
            @left, @right = 1, 0.5
          when 'c'
            @left, @right = 0.5, 1
          when 'x'
            @buzzer = @buzzer == 1 ? 0 : 1
          when 'r'
            @speed += 0.1 if @speed < 1
          when 'f'
            @speed -= 0.1 if @speed > 0
          when 'q'
            break
          end
        end
      end
    end

    def scan
      {
        left: @left * @speed,
        right: @right * @speed,
        buzzer: @buzzer
      }
    end
  end
end
