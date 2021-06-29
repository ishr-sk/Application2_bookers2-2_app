class UsersController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

# 自分の投稿bookを表示
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
  # ユーザid探す
    @user = User.find(params[:id])
  # もしユーザがログインユーザだったらそのまま編集に進む
    if @user == current_user
      render :edit
  # その他のユーザは自分のユーザ詳細が画面に飛ぶ
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
