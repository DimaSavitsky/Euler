description = <<-HERE
   It turns out that F541, which contains 113 digits, is the first Fibonacci number for
   which the last nine digits are 1-9 pandigital (contain all the digits 1 to 9,
   but not necessarily in order). And F2749, which contains 575 digits, is the first
   Fibonacci number for which the first nine digits are 1-9 pandigital.

   Given that Fk is the first Fibonacci number for which the first nine digits
   AND the last nine digits are 1-9 pandigital, find k.
HERE

using DeterminingPandigitalNumber

Problem.new(name: 'Pandigital Fibonacci ends', number: 104, description: description) do
  FibonacciSequenceGenerator.new.find_index { |integer| integer.pandigital_ends? }
end
