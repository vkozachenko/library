class AuthorsController < ApplicationController

  before_action :signed_in_user, only: [:new, :create]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = 'Author was successfully created'
      redirect_to @author
    else
      render 'new'
    end
  end

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

  def signed_in_user
    redirect_to signin_path unless signed_in?
  end

end
