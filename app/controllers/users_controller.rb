class UsersController < ApplicationController
  def show
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
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
end
