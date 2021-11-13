class TypeFormatsController < ApplicationController
  
  def index
    @type_format = TypeFormat.new()
    @type_formats = TypeFormat.all
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

  private
  def type_format_params
    params.require(:type_format).permit(:title)
  end
  
  
end
