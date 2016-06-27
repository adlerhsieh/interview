class A
  def initialize
    @bar = 10
  end

  def foo
    @bar ||= 20
  end

  def bar
    @bar
  end
end

a = A.new
a.foo
a.bar