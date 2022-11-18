class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render :new
    end
  end
end

private
def set_list
  @bookmark = Bookmark.find(params[:id])
end

def bookmark_params
  params.require(:bookmark).permit(:comment)
end
