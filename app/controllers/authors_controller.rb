class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def index
    @authors = Author.paginate(page: params[:page])
  end

  private

  def author_params
    params.require(:author).permit(:name, :description)
  end

end
