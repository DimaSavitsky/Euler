description = <<-HERE
   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
   What is the 10 001st prime number?
HERE

Problem.new(name: '10001st prime', number: 7, description: description) do
  PrimesSequenceGenerator.new.number(10000)
end
