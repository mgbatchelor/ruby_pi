class Scanner

  def scan
    raise NotImplementedError
  end

  class Random < Scanner
    def scan
      {
        value: rand(100)
      }
    end
  end

  class Console < Scanner
    require 'io/console'

    def initialize
      @data = {}
      @speed = 1
      RPi::GPIO.setup(16, as: :output)
      @buzzer = RPi::GPIO::PWM.new(16, 500)
      @buzzer.start 0
      Thread.new do
        loop do
          case STDIN.getch
          when 'w'
            @data[:left] = 1
            @data[:right] = 1
          when 'a'
            @data[:left] = 1
            @data[:right] = 0
          when 'd'
            @data[:left] = 0
            @data[:right] = 1
          when 's'
            @data[:left] = 0
            @data[:right] = 0
          when 'z'
            @data[:left] = 1
            @data[:right] = 0.5
          when 'c'
            @data[:left] = 0.5
            @data[:right] = 1
          when 'x'
            @buzzer.duty_cycle = @buzzer.duty_cycle == 1 ? 0 : 1
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
      Hash[@data.map{|k, v| [k, @speed * v]}]
    end

  end

  class Gpio < Scanner

    def initialize(mapping)
      @mapping = mapping
      initialize_mapping
    end

    def scan
      Hash[read_mapping]
    end

    private
    def initialize_mapping
      @mapping.each do |name, pin|
        RPi::GPIO.setup(pin, as: :input)
      end
    end

    def read_mapping
      @mapping.map do |name, pin|
        [name, read(pin)]
      end
    end

    def read(pin)
      RPi::GPIO.high?(pin) ? 1 : 0
    end
  end

end
