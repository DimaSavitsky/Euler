description = <<-HERE
              The prime factors of 13195 are 5, 7, 13 and 29.
              What is the largest prime factor of the number 600851475143 ?
HERE

Problem.new(name: 'Largest Prime Factor', number: 3, description: description ) do
  composite = 600851475143

  primes = PrimesSequenceGenerator.new

  while composite != 1
    current = primes.next
    while composite % current == 0
      composite /= current
    end
  end

  current
end
