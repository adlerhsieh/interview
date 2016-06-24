class A
  attr_reader :bar

  def initialize
    @bar = 10
  end

  def foo
    @bar ||= 20
  end
end

a = A.new
a.foo
a.bar

====Answer====
10
