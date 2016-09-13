class Scanner

  def scan
    raise NotImplementedError
  end

  class RandomScanner < Scanner
    def scan
      {
        value: rand(100)
      }
    end
  end

  class GpioScanner < Scanner

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
