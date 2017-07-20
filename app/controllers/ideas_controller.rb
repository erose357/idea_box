class IdeasController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
  end

  def create
    user = User.find(params[:user_id])
    @idea = user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea created!"
      redirect_to user_path(user)
    else
      render new_user_idea_path(user)
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
