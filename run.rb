require_relative 'lib/ruby_pi'
require 'rpi_gpio'
RPi::GPIO.set_numbering :bcm
Runner.new.run
