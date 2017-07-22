class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "#{@category.name} created!"
      redirect_to admin_categories_path
    else
      flash[:notice] = "Name must be filled in"
      render new_admin_category_path
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:notice] = "#{category.name} deleted"

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
