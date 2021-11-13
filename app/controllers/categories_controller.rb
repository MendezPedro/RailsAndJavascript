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
        format.html { redirect_to categories_path, notice: 'category create' }
      else
        format.html { redirect_to categories_path, alert: 'alert category not create' }
      end
    end
  end

  # def update 
  #   @category = Category.find(params[:id])
  #   @category.public = @category.subcategories.public
  #   respond_to do |f|
  #     if @category.update!(categry_params) 
  #       f.html { redirect_to categories_path, notice: "creaste"}
  #     else
  #       f.html { redirect_to categories_path, alert: "boo"}
  #     end
  #   end
  # end

  def api
    @category = Category.find(params[:id])
    render json: @category.to_json(include: [:sub_categories, :urlmarks])
  end
  

  private
  def category_params
    params.require(:category).permit(:title, :public, :category_id)
  end
end
