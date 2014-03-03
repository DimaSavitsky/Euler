description = <<-HERE
   The 12th term, F12, is the first term to contain three digits.
   What is the first term in the Fibonacci sequence to contain 1000 digits?
HERE

Problem.new(name: '1000-digit Fibonacci number', number: 25, description: description) do
  raise 'Not implemented'

  fib = FibonacciSequenceGenerator.new
end
