class UsersController < ApplicationController
  def show
	@user = User.find(current_user.id)
  end

  def new
  end

  def edit
  end
end
