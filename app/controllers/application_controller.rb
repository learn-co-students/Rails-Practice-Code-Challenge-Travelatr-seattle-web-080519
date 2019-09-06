class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @bloggers = Blogger.all
    @destinations = Destination.all
    @posts = Post.all

    render :index
  end

end