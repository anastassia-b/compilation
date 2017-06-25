class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    
  end

  def activate

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
