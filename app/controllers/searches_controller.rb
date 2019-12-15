class SearchesController < ApplicationController
  def index
    if params[:area].present?
      @post = Post.where('area LIKE ?', "%#{params[:area]}%")
      @posts = @post.page(params[:page])
      @post1=Post.find_by(area: params[:area])
    else
      @post = Post.none
    end
  end
end
