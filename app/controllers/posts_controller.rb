class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index ,:show ,:search]
  def index
    if params[:search_title]
      @post = Post.find(:all, :conditions => ['title like ?',"%#{params[:search_title]}"])
      redirect_to @post if @post.present?
    else
      @post = Post.all
    end
    @posts = Post.paginate :page => params[:page], :per_page => 3
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
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
    @posts = Post.find(params[:id])
  end

  def update
    @posts = Post.find(params[:id])

    if @posts.update_attributes(params[:post])
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
end
