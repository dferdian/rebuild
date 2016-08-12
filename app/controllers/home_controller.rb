class HomeController < ApplicationController

  def index
    response.write "Hello from Home Controller"
  end
end
