require "erb"

module Rendering
  def render(action)
    response.write render_to_string(action)
  end

  def render_to_string(action)
    path = template_path(action)
    template = ERB.new(File.read(path))
    # Objects of class Binding encapsulate the execution context at some
    # particular place in the code and retain this context for future use
    template.result(binding)
  end

  def template_path(action)
    "app/views/#{controller_name}/#{action}.html.erb"
  end

  def layout_path
    "app/views/layouts/application.html.erb"
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # HomeController => "home"
  end
end
