class PostsController < ApplicationController
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
      render 'toppages/index'
    end
  end

  def show
    @post = Post.find(params[:id])
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
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
  private

  def post_params
    params.require(:post).permit(:area, :country, :place, :comment, :photo)
  end
end
