class SyousaiController < ApplicationController

 def show
     @post = Post.find(params[:id])
     @user = User.find_by(id: @post.user_id)
     @posts = @user.posts.order(id: :desc).page(params[:page]).per(5)
    counts(@user)
 end
end