class Application
  @@routes = {}

  def self.get(path, &block)
  	@@routes[path] = yield
  end

  def self.routes
  	@@routes
  end
end

Application.get '/' do
  'foo'
end

Application.routes['/foo']

====Answer====
nil