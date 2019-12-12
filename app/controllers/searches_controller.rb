class SearchesController < ApplicationController
  def index
    if params[:area].present?
      @post = Post.where('area LIKE ?', "%#{params[:area]}%")
      @posts = @post.page(params[:page])
    else
      @post = Post.none
    end
  end
end
