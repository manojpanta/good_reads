class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @ratings = @book.ratings
  end
end
