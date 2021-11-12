class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
    if true
      # @main_category = Category.name_category(@categories)
    else
      @main_category = 'none'
    end
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save 
        format.html { redirect_to root_path, notice: 'category create' }
      else
        format.html { redirect_to root_path, alert: 'alert category not create' }
      end
    end
  end

  private
  def category_params
    params.require(:category).permit(:title, :public, :category_id)
  end
end
