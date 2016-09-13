class Processor

  def process(state)
    raise NotImplementedError
  end

  class StdOutProcessor < Processor

    def process(state)
      puts "#{Time.now} - #{state.states}"
    end

  end

  class GpioProcessor < Processor
    def initialize(mapping)
      @mapping = mapping
      initialize_mapping
    end

    def process(state)
      state.states.each do |name, value|
        write(@mapping[name], value)
      end
    end

    private
    def initialize_mapping
      @mapping.each do |name, pin|
        RPi::GPIO.setup(pin, as: :output)
      end
    end

    def write(pin, value)
      return unless pin
      if value == 1
        RPi::GPIO.set_high(pin)
      else
        RPi::GPIO.set_low(pin)
      end
    end
  end

end
