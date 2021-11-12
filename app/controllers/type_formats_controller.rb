class TypeFormatsController < ApplicationController
  
  def index
    @type = TypeFormat.new()
    @type_formats = TypeFormat.all
  end

  def create
    @type = TypeFormat.new(type_format_params)
    respond_to do |format|
      if @type.save 
        format.html { redirect_to root_path, notice: 'type create' }
      else
        format.html { redirect_to root_path, alert: 'alert type not create' }
      end
    end
  end

  private
  def type_format_params
    params.require(:type_format).permit(:title)
  end
  
  
end
