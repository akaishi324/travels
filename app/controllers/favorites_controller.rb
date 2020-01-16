class FavoritesController < ApplicationController
  def create
  post = Post.find(params[:post_id])
  current_user.favorite(post)
  flash[:success] = "行きたいリストに追加しました！"
  redirect_to root_path
  end

  def destroy
  post = Post.find(params[:post_id])
  current_user.unfavorite(post)
  flash[:success] = "行きたいリストから外しました！"
  redirect_to root_path
  end
end
