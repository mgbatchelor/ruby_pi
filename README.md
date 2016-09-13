# RubyPi

### How to create a basic Ruby Pi Runner

```ruby
require_relative 'lib/ruby_pi'
Runner.new(Brain.new, RandomScanner.new, StdOutProcessor.new).run
```

### How to create a GPIO Based Ruby Pi Runner

```ruby
require_relative 'lib/ruby_pi'
scanner = GpioScanner.new(distance: 10, temp: 11)
processor = GpioProcessor.new(left: 20, right: 21)
Runner.new(Brain.new, scanner, processor).run
```
