require "lib/action_controller"
require "app/controllers/application_controller"

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)
    controller_class = load_controller_class(controller_name) # HomeController

    controller = controller_class.new   # HomeController.new
    controller.request = request
    controller.response = response
    controller.process(action_name)

    response.finish
  end

  def route(path)
    # path = "/home/index" => "". "home", "index"
    _, controller, action = path.split("/")
    [ controller || "home", action || "index" ]
  end

  def load_controller_class(name)
    # "home" => "HomeController"
    require "app/controllers/#{name}_controller"
    Object.const_get(name.capitalize + "Controller")
  end
end
