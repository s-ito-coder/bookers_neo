class HomeController < ApplicationController
  def index
  	@user = User.find(params[:id])
  end

  def show
  end

  def about
  end
end
