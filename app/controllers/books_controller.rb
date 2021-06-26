class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end

  def show
  end

  def index
    @books = Book.all
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end

  private
  # ストロングパラメータ
 def book_params
   params.require(:book).permit(:title, :body)
 end
  
end
