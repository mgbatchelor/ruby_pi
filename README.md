# RubyPi

### How to create a basic Ruby Pi Runner

```ruby
require_relative 'lib/ruby_pi'
Runner.new(Brain.new, Scanner::Random.new, Processor::StdOut.new).run
```

### How to create a GPIO Based Ruby Pi Runner

```ruby
require_relative 'lib/ruby_pi'
scanner = Scanner::Gpio.new(distance: 10, temp: 11)
processor = Processor::Gpio.new(left: 20, right: 21)
Runner.new(Brain.new, scanner, processor).run
```
