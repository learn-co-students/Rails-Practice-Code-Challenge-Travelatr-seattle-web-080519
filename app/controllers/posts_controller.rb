class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
    render :new
  end
  
  def create
    title = params[:post][:title]
    content = params[:post][:content]
    likes = 0

    blogger_id = params[:blogger_id]
    blogger = Blogger.find(blogger_id)

    destination_id = params[:destination_id]
    destination = Destination.find(destination_id)

    @post = Post.new(
      title: title, content: content, likes: likes,
      blogger: blogger,
      destination: destination
    )

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @destination = Destination.find_by(id: @post.destination_id)
    @blogger = Blogger.find_by(id: @post.blogger_id)

    render :show
  end
  
  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    
    @post = Post.find(params[:id])
    
    # @post_params = post_params
    # byebug
    

    @post.update(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end

  end

  def likes
    @post = Post.find(params[:id])
    @post.like_post
    redirect_to post_path(@post)
  end


  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end