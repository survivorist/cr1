class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show

    @user = User.find(current_user[:id])
   
  end

  def edit
  	@user = User.find(current_user[:id])
  
end

