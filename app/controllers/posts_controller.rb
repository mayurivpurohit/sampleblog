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
  end

  def show
    @post = Post.find(params[:id])
    @user= User.find_by_sql("SELECT users.id , users.first_name,users.last_name,posts.id, posts.title FROM `users` LEFT OUTER JOIN posts ON posts.user_id = users.id")
    @user.each do |name|
     @first_name = name.first_name
     @last_name = name.last_name
    end
    Rails.logger.debug "--- #{@first_name} #{@last_name} ---"
  end

  def new
    @post = Post.new
    Rails.logger.debug "creating new post"
  end

  def create
    @post = Post.new(params[:post])
    if  @post.save
      redirect_to posts_path, :notice => "Successfully created post"
    else
      render "new"
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
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to post_path, :notice => "Successfully deleted"
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
