class PrimesSequenceGenerator < AbstractSequenceGenerator

  def self.initialization_block
    Proc.new do |prime_integer|
      initial = FIRST_PRIMES.reverse
      values = []
      loop do
        next_prime =  initial.pop

        new_primes = next_prime ? [next_prime] : calculate_next_primes(values)

        new_primes.each do |prime|
          values << prime
          prime_integer << prime
        end
      end
    end
  end

  private
  # A hack to speedup generation of sequence starting elements
  FIRST_PRIMES = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

  def self.calculate_next_primes(values)
    last = values.last
    range = (last + 1)...last * 2
    (2..last).reduce(range.to_a) do |candidates, multiplier|
      candidates - values.map {|a| a * multiplier }
    end
  end

end
