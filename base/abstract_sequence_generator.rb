class AbstractSequenceGenerator

  def initialize
    @generator = Enumerator.new(&self.class.initialization_block).lazy
    @index = 0
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
  alias_method :[], :number

  def next
    @index += 1
    number(@index)
  end

  def self.initialization_block
    raise 'It is an abstract class to be inherited'
  end

end
