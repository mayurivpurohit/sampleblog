class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index ,:search]
  def index
    if params[:search_title]
      @post = Post.find_by_title(params[:search_title])
       redirect_to @post if @post.present?
    else
      @post = Post.all
    end
    # @post = Post.all
    @posts = Post.paginate :page => params[:page], :per_page => 3
    respond_to do |format|
      format.html
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by_id(@post.user_id)
    respond_to do |format|
      format.html
    end
  end

  def new
    @post = Post.new
    Rails.logger.debug "creating new post"
    respond_to do |format|
      format.html
    end
  end

  def create
    @post = Post.new(params[:post])
    if  @post.save
      Rails.logger.debug "-------------------"
      PostMailer.create_post(@post).deliver
      Rails.logger.debug "-------------------"
      redirect_to posts_path, :notice => "Successfully created post"
    else
      render "new"
    end
    respond_to do |format|
      format.html
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to posts_path, :notice => "Post updated succefully"
    else
      render "edit"
    end
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to post_path, :notice => "Successfully deleted"
    respond_to do |format|
      format.html
    end
  end
  # def search
  #   if params[:search_title]
  #     @post = Post.find_by_title(params[:search_title])
  #      redirect_to @post if @post.present?
  #   else
  #     @post = Post.all
  #   end
  # end
end
