class HomeController < ApplicationController
  def index
  end

  def show
	@user = User.find(current_user.id)
  end

  def about
  end

  private
  def user_before_action?
  	false
  end
end
