class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path, notice: "User was successfully created!"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path, notice: "User was successfully updated!"
  end

  private

  def user_params
    params.require(:user).permit(
    :first_name,
    :last_name,
    :email
    )
  end
end
