require 'spec_helper'
dir = __FILE__.split("/")[0..-3]
dir += %w(tmp methods)
dir = dir.join("/")
Dir["#{dir}/*.rb"].each do |file|
  require file
end
