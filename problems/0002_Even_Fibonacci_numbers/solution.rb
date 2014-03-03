require File.join(File.expand_path(File.dirname(__FILE__)), '../..' , 'generators', 'fibonacci_generator')

fib = FibonacciGenerator.new
puts fib.take_while {|s| s < 4000000 }.select {|s| s.even? }.reduce(:+)

