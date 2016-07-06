require 'colorize'
require "readline"

class Console
  def self.collect(dir)
    Dir[dir].sort_by{ |x| x[/\d+/].to_i }.each_with_index do |f, i|
      yield(f, i)
    end
  end
end
