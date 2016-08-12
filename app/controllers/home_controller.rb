class HomeController < ApplicationController

  def index
    @message = "Home Controller"
    render :index
  end
end
