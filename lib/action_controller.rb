require "rendering"

module ActionController
  class Base
    include Rendering

    attr_accessor :request, :response

    def process(name)
      send(name)
    end
  end
end
