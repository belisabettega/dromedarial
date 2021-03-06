class CategoriesController < ApplicationController
  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(secure_params)
    @category.user = current_user
    authorize @category
    if @category.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

  def secure_params
    params.require(:category).permit(:title, :price)
  end
end
