class FibonacciGenerator

  def initialize
    @generator = Enumerator.new do |fibonacci_integer|
      first = 0
      second = 1
      loop do
        fibonacci_integer << first
        first, second = second, first + second
      end
    end.lazy
  end

  def method_missing(name, *args, &block)
    if @generator.public_methods.include?(name)
      @generator.send(name, *args, &block)
    else
      super
    end
  end

  def number(n)
    self.take(n + 1).find.with_index { |elem, i| i == n }
  end

end
