class ToppagesController < ApplicationController
  def index
  #@post=Post.all
  @posts=Post.all.order(id: :desc).page(params[:page]).per(5)
  end
end
