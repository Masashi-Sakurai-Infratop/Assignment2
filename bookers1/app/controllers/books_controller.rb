class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

## createアクションとupdateアクションの挙動の違いに注意
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save  # 保存が成功したかで分岐
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) # 更新が成功したかで分岐
      flash[:notice] = "Book was successfully created"
      redirect_to book_path
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
