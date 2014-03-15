description = <<-HERE
  The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
  There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
  How many circular primes are there below one million?
HERE

using StringRotations

Problem.new(name: 'Circular primes', number: 35, description: description) do
  primes_below_million = PrimesSequenceGenerator.new.take_while {|s| s < 1000000 }.map(&:to_s).to_a

  primes_below_million.select do |num|
    num.rotations.all? do |rotated|
      primes_below_million.include? rotated
    end
  end.count
end
