module A
  def foo
    'foo'
  end
end

class B
  extend A
end

B.new.foo

====Answer====
exception