class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]
  before_action :set_bookmark, only: [:destroy]
 
  def new
    @bookmark = @list.bookmarks.new
  end
 
  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to @list, notice: "Bookmark was sucess"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @bookmark.destroy
    redirect_to @bookmark.list, notice: "Removed"
  end
 
 
  private

    def set_list
      @list = List.find(params[:list_id])    
    end

    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def bookmark_params
      params.require(:bookmark).permit(:movie_id, :comment)
    end
end



