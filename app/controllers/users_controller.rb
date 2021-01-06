class UsersController < ApplicationController
  before_action :set_user

  def show
    @trips = @user.trips.order(created_at: 'DESC')
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.js { render js: "window.location = '#{user_path(@user.id)}'" }
        bypass_sign_in(@user)
      else
        format.js { render js: "alert('正しい値を入力して下さい');" }
      end
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
