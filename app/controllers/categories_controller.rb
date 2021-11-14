class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
    #@title_category = @title_category.name_category(2)
    #@title_category = @categories.where(id: 6).pluck(:title)[0]
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
    #@category.public = @category.sub_categories.change_public()
    respond_to do |f|
      if @category.update!(category_params) 
        # para que la vista no haga nada
        # format.js { render nothing: true, notice: 'update' }
        f.js { redirect_to categories_path, notice: 'category create' }
      else
        f.html { redirect_to categories_path, alert: "category no update"}
      end
    end
  end

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

  def name_category
    @category = Category.find(params[:id])
  end
  
  
  private
  def category_params
    params.require(:category).permit(:title, :public, :category_id)
  end
end
