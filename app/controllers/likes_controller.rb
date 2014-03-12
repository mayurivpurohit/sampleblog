class LikesController < ApplicationController

def create
  @like = Like.create(params[:like])
    @post = @like.post
    render :tog_like
end

def destroy
  like = Like.find(params[:id]).destroy
    @post = like.post
    render :tog_like
end
end
