description = <<-HERE
   The 12th term, F12, is the first term to contain three digits.
   What is the first term in the Fibonacci sequence to contain 1000 digits?
HERE

using CountingIntegerLength

Problem.new(name: '1000-digit Fibonacci number', number: 25, description: description) do
  FibonacciSequenceGenerator.new.find_index { |integer| integer.length == 1000 }
end
