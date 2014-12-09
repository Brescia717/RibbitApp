class RibbitsController < ApplicationController
  def index
  end

  def new
    @ribbit = Ribbit.new
  end

  def create
    @ribbit = Ribbit.new(params[ribbit_params])
    @ribbit.user_id = current_user.id

    if @ribbit.save
      redirect_to current_user
    else
      flash[:error] = "Problem!"
      redirect_to current_user
    end
  end

  private

  def ribbit_params
    params.require(:ribbit).permit(:content)
  end
end
