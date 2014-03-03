class NaturalSequenceGenerator < AbstractSequenceGenerator

  def self.initialization_block
    Proc.new do |natural_integer|
      iterator = 0
      loop do
        natural_integer << iterator
        iterator += 1
      end
    end
  end

end
