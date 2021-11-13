class UrlmarksController < ApplicationController
  def index
    @urlmark = Urlmark.new
    @urlmarks = Urlmark.all
  end

  def create
    @urlmark = Urlmark.new(urlmarks_params)
    respond_to do |format|
      if @urlmark.save 
        format.html { redirect_to urlmarks_path, notice: 'url bookmarks create' }
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
