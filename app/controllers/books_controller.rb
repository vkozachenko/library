class BooksController < ApplicationController

  before_action :correct_user,    only: [:destroy, :edit, :update]
  before_action :signed_in_user,  only: [:destroy, :edit, :update]

  def new
    @book     = Book.new
    @authors  = Author.all
    @groups   = Group.all
  end

  def show
    @book = Book.find(params[:id])
    redirect_to root_path if @book.draft && !signed_in? && current_user != @book.user
  end

  def create
    unless params[:authors_ids].blank?
      @book = Book.new(book_params)
      @book.user = current_user
      authors_ids = params[:authors_ids].split(',') || []
      authors_ids.each do |id|
        @book.authors << Author.find(id)
      end
      unless params[:groups_ids].blank?
        groups_ids = params[:groups_ids].split(',') || []
        groups_ids.each do |id|
          @book.groups << Group.find(id)
        end
      end

      if @book.save
        flash[:success] = "Book was successfully created"
        redirect_to @book
      else
        new
        flash.now[:error] = 'Fill required filds'
        render 'new'
      end
    else
      new
      flash.now[:error] = "Choose at least one author"
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
        flash[:success] = "Book updated"
        redirect_to @book
      else
        render 'edit'
      end
  end

  def index
    @books = Book.publics.last_week.paginate(page: params[:page])
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book deleted."
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :cover, :draft)
  end

  def correct_user
    @book = Book.find(params[:id])
    redirect_to(root_url) unless current_user? @book.user
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

end
