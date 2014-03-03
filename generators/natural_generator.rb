class NaturalGenerator

  def initialize
    @generator = Enumerator.new do |natural_integer|
      iterator = 0
      loop do
        natural_integer << iterator
        iterator += 1
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
