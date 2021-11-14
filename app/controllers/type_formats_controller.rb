class TypeFormatsController < ApplicationController
  
  def index
    @type_format = TypeFormat.new()
    @type_formats = TypeFormat.all

    @urlmarks = Urlmark.all
    @url_types = @urlmarks.group("type_format_id").count
    #@url_types2 = @type_formats.group(:title).count
    #@url_types = Urlmark.joins(:type_formats).where('type_formats.created_at > ? ', 1.year.ago).group(:origin).count
  end

  def create
    @type_format = TypeFormat.new(type_format_params)
    respond_to do |format|
      if @type_format.save 
        format.html { redirect_to type_formats_path, notice: 'type create' }
      else
        format.html { redirect_to type_formats_path, alert: 'alert type not create' }
      end
    end
  end

  def show
    @type_format = TypeFormat.find(params[:id])
  end

  def new
    @type_format = TypeFormat.new
  end

  def edit
    @type_format = TypeFormat.find(params[:id])
  end

  def update
    @type_format = TypeFormat.find(params[:id])
    respond_to do |format|
      if @type_format.update(type_format_params)
        format.js { redirect_to type_formats_path, notice: 'type update' }
      else
        format.html { redirect_to urlmarks_path, alert: 'alert' }
      end
    end
  end

  def destroy
    @type_format =TypeFormat.find(params[:id])
    respond_to do |format|
      if @type_format.destroy!
        format.js { redirect_to type_formats_path, notice: 'type destroy' }
      else
        format.html { redirect_to categories_path, alert: 'alert' }
      end
    end
  end

  private
  def type_format_params
    params.require(:type_format).permit(:title)
  end
  
  
end
