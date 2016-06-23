class Calculator
  attr_reader :result

  def initialize(init, &block)
    @result = init
    instance_eval(&block)
  end

  def plus(x)
    @result = @result + x
  end

  def minus(x)
    @result = @result - x
  end

  def multiply(x)
    @result = @result * x
  end
end

calculation = Calculator.new(5) do 
  plus(2)
  minus(3)
  multiply(10)
end

calculation.result

====Answer====
40