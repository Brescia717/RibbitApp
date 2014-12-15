class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @ribbit = Ribbit.new
    @relationship = Relationship.where(
      follower_id: current_user.id,
      followed_id: @user.id
      ).first_or_initialize if current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      # flash[:success] = "You have successfully updated your profile."
      redirect_to user_path(@user)
    else
      # flash[:alert] = "You need to submit a photo."
      render 'show'
    end
  end

  def buddies
    @buddies_ids = []
    @current_user = current_user
    if current_user
      @ribbit = Ribbit.new
      @current_user.followeds.each do |f|
        @buddies_ids << f.id#.map(&:id).push(current_user.id)
      end
      @ribbits = Ribbit.where(user_id: @buddies_ids)
    else
      redirect_to root_url
    end

  end

  private
  def user_params
    return { email: nil } unless params[:user]
    params.require(:user).permit(:avatar_url, :email)
  end
end
