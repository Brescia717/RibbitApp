class UsersController < ApplicationController
  def new
    @user = User.new
    if current_user
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    return { email: nil } unless params[:user]
    params.require(:user).permit(:avatar_url, :email)
  end
end
