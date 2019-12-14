class ToppagesController < ApplicationController
  def index
  #@post=Post.all
  @posts=Post.all.page(params[:page])
  end
end
