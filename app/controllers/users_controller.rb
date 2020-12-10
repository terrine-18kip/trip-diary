class UsersController < ApplicationController
  before_action :set_user

  def show
    @trips = @user.trips
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
      bypass_sign_in(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image, :name, :email, :password)
  end
end
