class UrlmarksController < ApplicationController
  def index
    @urlmarks = Urlmark.all
  end

  def new
    @urlmark = Urlmark.new
    @type_formats = TypeFormat.all
    @categories = Category.all
  end
  
  def show
    @urlmark = Urlmark.find(params[:id])
  end
  
  def create
    @urlmark = Urlmark.new(urlmarks_params)
    respond_to do |format|
      if @urlmark.save 
        format.js {  }
      else
        format.html { redirect_to urlmarks_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  def edit
    @urlmark = Urlmark.find(params[:id])
    @type_formats = TypeFormat.all
    @categories = Category.all
  end
  
  def update
    @urlmark = Urlmark.find(params[:id])
    respond_to do |format|
      if @urlmark.update(urlmarks_params)
        format.js {  }
      else
        format.html { redirect_to urlmarks_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  def destroy
    @urlmark = Urlmark.find(params[:id])
    respond_to do |format|
      if @urlmark.destroy!
        format.js {  }
      else
        format.html { redirect_to urlmarks_path, alert: 'alert url bookmarks not create' }
      end
    end
  end

  private
  def urlmarks_params
    params.require(:urlmark).permit(:url, :category_id, :type_format_id)
  end
end
