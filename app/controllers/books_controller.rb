class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all

  end

  def create
      @book = Book.new(book_params)
      @books = Book.all
       
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end 
  

   
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:success] = "Book was successfully destroy."
    redirect_to '/books'
  end


  def show
    @book = Book.find(params[:id])


  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
    @book.update(book_params)
    book.update(book_params)
    
    if @book.save
      flash[:update] = "Book was successfully update."
      redirect_to book_path(@book.id)
 
      
    else
      render :edit
    end 
  end
    
  


private
  def book_params
    params.require(:book).permit(:title, :body )



  end
end

