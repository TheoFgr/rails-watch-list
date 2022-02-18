class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
    @bookmarks = Bookmark.all
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end

    def destroy
      List.destroy
      redirect_to lists_path
    end

  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
