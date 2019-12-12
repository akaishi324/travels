class ToppagesController < ApplicationController
  def index
  @post=Post.all
  @posts=@post.page(params[:page])
  end
end
