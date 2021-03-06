class IdeasController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new
    @images = Image.all
  end

  def create
    user = User.find(params[:user_id])
    @idea = user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Idea created!"
      redirect_to user_path(user)
    else
      flash[:notice] = "All fields must be filled in"
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)

    flash[:notice] = "#{@idea.title} updated!"

    redirect_to user_idea_path(@idea.user, @idea)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to user_path(@idea.user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, image_ids:[])
  end
end
