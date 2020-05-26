class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full__messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    @posts = Post.find(params[:id])
    @post.destroy
    redirect_to post_url
  end

  private
  def post_params 
    params.require(:post).permit(:title, :url, :content, :sub_id,:author_id)
  end
end