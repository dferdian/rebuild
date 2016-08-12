module ActionController
  class Base
    attr_accessor :request, :response

    def process(name)
      send(name)
    end
  end
end
