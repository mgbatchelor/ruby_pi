require_relative 'lib/ruby_pi'
require 'rpi_gpio'
RPi::GPIO.set_numbering :bcm
scanner = Scanner::Console.new
processor = Processor::Gpio.new(left: 20, right: 21)
Runner.new(Brain.new, scanner, processor).run
