class BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Book not found' }, status: :not_found
  end

  def create
  @book = Book.new(book_params)
  if @book.save
    render json: @book, status: :created
  else
    render json: { error: @book.errors.full_messages.join(", ") }, status: :unprocessable_entity
  end
end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    render json: @book
  else
    render json: { error: @book.errors.full_messages.join(", ") }, status: :unprocessable_entity
  end
end


private

def book_params
  params.require(:book).permit(:title, :description, :cover_url, :progress)
end
end
