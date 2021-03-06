class PostsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def new
    if logged_in?
      @post = current_user.posts.build  # form_with 用
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @posts = current_user.posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    
    
  end 
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @post
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id!= @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  
  
  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to("/")
  end
  
  private

  def post_params
    params.require(:post).permit(:area, :country, :place, :comment, :photo)
  end
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end
end
