class Pwm
  attr_reader :pwm

  def initialize(pin)
    RPi::GPIO.setup(pin, as: :output)
    @pwm = RPi::GPIO::PWM.new(pin, 1000)
    @pwm.start(0)
  end

  def set(value)
    @pwm.duty_cycle = value * 100
  end
end

class Wheel < Pwm; end
class Buzzer < Pwm
  def set(value)
    @pwm.duty_cycle = value * 50
  end
end
