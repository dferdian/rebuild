class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    response.write "Hello Ruby!"
    response.finish
  end
end
