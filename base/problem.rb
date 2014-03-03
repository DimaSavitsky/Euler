class Problem
  attr_reader :number, :description

  class << self
    def all_problems
      @problems_added ||= []
      @problems_added.sort! {|a,b| a.number <=> b.number }
    end

    def select(number)
      all_problems.find {|problem| problem.number == number }
    end

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
    "#< Problem #{ @number || '- without number -' } - #{ @name } >"
  end

  def view_source
    @source
  end

end
