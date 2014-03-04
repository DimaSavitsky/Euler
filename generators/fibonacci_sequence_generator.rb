class FibonacciSequenceGenerator < AbstractSequenceGenerator

  def self.initialization_block
    Proc.new do |fibonacci_integer|
      old = 0
      new = 1
      loop do
        fibonacci_integer << old
        old, new = new, old + new
      end
    end
  end

end
