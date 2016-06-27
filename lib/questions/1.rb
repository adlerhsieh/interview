class A
  def self.foo
   'foo'	
  end
end

class B < A
  def foo
    'bar'
  end
end

B.foo
