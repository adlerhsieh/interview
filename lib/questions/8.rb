class A
  def foo
    @bar -= 3
  end
end

class B < A
  def initialize
    @bar = 1
  end

  def foo
    @bar += 2
    super
  end

  def bar
    @bar
  end
end

b = B.new
b.foo
b.bar