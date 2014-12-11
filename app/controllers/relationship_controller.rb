class RelationshipController < ApplicationController
  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.follower = current_user
    # @relationship.followed_id = params[:followed_id]
    # @relationship.follower_id = current_user.id
    @user = User.find(params[:followed_id])
    if @relationship.save
      redirect_to root_path#User.find(params[:followed_id])
    else
      flash[:error] = "Couldn't Follow"
      redirect_to root_path
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    redirect_to user_path(params[:id])
  end

  private
  def relationship_params
    params.require(:relationship).permit(:followed_id, :follower_id)
  end
end
