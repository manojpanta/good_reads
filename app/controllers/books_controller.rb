class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @top_review = @book.top_review
    @low_review = @book.low_review
  end
end
