class Problem
  attr_reader :number, :description

  class << self
    def all_problems
      @problems_added ||= []
      @problems_added.sort_by!(&:number)
    end

    def select(number)
      all_problems.find {|problem| problem.number == number }
    end
    alias_method :find, :select

    def add_problem(problem)
      all_problems << problem
    end
  end

  def initialize(name: '-without name-', description: '-without description-', number: nil, &block)
    @name = name
    @description = description
    @number = number
    define_singleton_method(:solution, &block)
    self.class.add_problem(self)
  end

  def inspect
    "#< Problem #{ @number || '- without number -' } #{ @name } >"
  end

  def result
    @result ||= solution
  end

  def measure_solution
    Benchmark.measure do
      @result = solution
    end
  end

end
