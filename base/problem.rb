class Problem
  attr_reader :number, :description, :time

  class << self
    def all
      @problems_added ||= []
      @problems_added.sort_by!(&:number)
    end

    def select(number)
      all_problems.find {|problem| problem.number == number }
    end
    alias_method :find, :select

    def add_problem(problem)
      all << problem
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
    "#< Problem #{ @number || '- without number -' } #{ @name } , computation: #{ computation_status } >"
  end

  def result
    @result || try_solution
  end

  def time
    @time || alert_computation_status
  end

  private

  def try_solution
    if @computation.is_a? Thread
      alert_computation_status
    else
      run_solution
    end
  end

  def run_solution
    @computation = Thread.new do
      @time = Benchmark.measure do
        @result = solution
      end
    end.run
    alert_computation_status
  end

  def computation_status
    if @computation.is_a? Thread
      @computation.alive? ? 'started' : 'completed'
    else
      'not started'
    end
  end

  def alert_computation_status
    message = "Computation for #{ self.inspect } has been #{ computation_status }."
    ALERTER.report message
  end

end
