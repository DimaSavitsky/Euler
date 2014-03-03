class FibonacciSequenceGenerator < AbstractSequenceGenerator

  def self.initialization_block
    Proc.new do |fibonacci_integer|
      first = 0
      second = 1
      loop do
        fibonacci_integer << first
        first, second = second, first + second
      end
    end
  end

end
