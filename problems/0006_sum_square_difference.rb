description = <<-HERE
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
HERE

Problem.new(name: 'Sum Square Differences', number: 6, description: description ) do
  first_hundred =  NaturalSequenceGenerator.new.take(100)
  sum_of_squares = first_hundred.map {|a| a**2}.reduce(:+)
  square_of_sum = first_hundred.reduce(:+) **2
  sum_of_squares - square_of_sum
end
