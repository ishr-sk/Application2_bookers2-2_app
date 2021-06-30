class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    # インスタント変数じゃないとエラー分が表示されなかった
    @book = Book.new(book_params)
    #　投稿したidはログインしてるユーザidである(大事)
    @book.user_id = current_user.id
    # バリデーションの結果によりリダイレクト先変わる
    if @book.save
      redirect_to book_path(book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def index
    @book = Book.new
    @books = Book.all
    # ユーザはログインユーザ情報である
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user 
      render :edit
    else
      redirect_to books_path
    end
  end
  
  def update
    # ローカル変数だとデータが入らなかったからインスタント変数にする
    @book = Book.find(params[:id])
    if  @book.update(book_params)
      redirect_to book_path(book)
    else
      render :edit
    end
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
