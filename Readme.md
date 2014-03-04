This repository is a study/codesample repo of solutions for the problems given by project Euler.

http://projecteuler.net/problems

To start the console, enter

```
  ruby console.rb
```

After that, you can list all implemented problems by calling

```ruby
   Problem.all
```

And select a specific problem and view it's result calling

```ruby
  problem = Problem.find(2)
  problem.result
```

To measure time needed to produce a result call

```ruby
    problem.time
```
