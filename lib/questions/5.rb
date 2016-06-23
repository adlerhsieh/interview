class A
  attr_reader :a

  def initialize
    @a = 10
  end

  def foo
    @a ||= 20
  end
end

a = A.new.foo
a

====Answer====
10