class UsersController < ApplicationController
  # 編集画面表示、修正内容の更新アクション実行時はログインしているユーザーの場合のみ実行可とする。
    before_action :correct_user, only: [:edit, :update]

  def show
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
  	@user = User.all(current_user.id)
    @book = Book.new
  end

  def index
    @users = User.all
  	@user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User Profile was successfully updated."
	    redirect_to user_path(current_user.id)
  	else
	   	render :edit
    end
  end

	private
	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end

    def correct_user
      user = User.find(params[:id])
      if user != current_user
         redirect_to user_path(current_user)
      end
  end

end
