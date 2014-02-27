class LikesController < ApplicationController

def create
  @like = Like.create(params[:like])
    @post = @like.post
    # render :_tog_like_post
end

def destroy
  like = Like.find(params[:id]).destroy
    @post = like.post
    # render :_tog_like_post
end
end
