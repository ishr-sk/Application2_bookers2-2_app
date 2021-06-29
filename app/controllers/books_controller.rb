class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    #　投稿したidはログインしてるユーザidである(大事)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book)
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end

  def index
    @book = Book.new
    @books = Book.all
    # ユーザはログインユーザ情報である
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
 def book_params
   params.require(:book).permit(:title, :body)
 end
 
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
end
