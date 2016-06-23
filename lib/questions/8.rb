class A
  attr_accessor :foo
  def bar
    @foo -= 3
  end
end

class B < A
  def initialize
    @foo = 1
  end

  def bar
    @foo += 2
    super
  end
end

b = B.new
b.bar
b.foo

====Answer====
0
