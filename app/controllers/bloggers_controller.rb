class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all

    render :index
  end
  
  def new
    @blogger = Blogger.new
    render :new
  end

  def create
    name = params[:blogger][:name]
    bio = params[:blogger][:bio]
    age = params[:blogger][:age]

    puts "name: #{name}"
    puts "bio: #{bio}"
    puts "age: #{age}"

    @blogger = Blogger.new(name: name, bio: bio, age: age)

    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = Post.find_by(blogger_id: @blogger.id)
    render :show
  end
end
