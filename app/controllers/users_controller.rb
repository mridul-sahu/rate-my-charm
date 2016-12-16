class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Registered!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :picture)
  end

end
