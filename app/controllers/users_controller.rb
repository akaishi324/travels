class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show]
    def show
    @user = User.find(params[:id])
     @posts = @user.posts.order(id: :desc).page(params[:page])
    counts(@user)
    end
    def new
    @user = User.new
    end
    def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    end
    def likes
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
    end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
