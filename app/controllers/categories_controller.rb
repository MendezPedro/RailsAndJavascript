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
        format.js { redirect_to categories_path, notice: 'category create' }
      else
        format.html { redirect_to categories_path, alert: 'alert category not create' }
      end
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        # para que la vista no haga nada
        # format.js { render nothing: true, notice: 'update' }
        format.js { redirect_to categories_path, notice: 'category create' }
      else
        format.html { redirect_to categories_path, alert: 'alert url bookmarks not create' }
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

  def destroy
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.destroy!
        # para que la vista no haga nada
        #format.js { render layout: false, notice: 'lo re borraste' }
        format.js { redirect_to categories_path, notice: 'category destroy' }
      else
        format.html { redirect_to categories_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  def api
    @category = Category.find(params[:id])
    render json: @category.to_json(include: [:sub_categories, :urlmarks])
  end
  

  private
  def category_params
    params.require(:category).permit(:title, :public, :category_id)
  end
end
