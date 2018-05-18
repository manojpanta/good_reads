require 'rails_helper'

describe Book do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a title' do
        book = Book.new()
        expect(book).to be_invalid
      end
    end
  end

  describe 'relationships' do
    it 'has many  reviews' do
      book = Book.new(title: 'book')

      expect(book).to respond_to(:reviews)
    end
  end
  describe 'class methhod' do
    it 'average ratings calculates average rating' do
      book = Book.create(title: 'book')
      user = User.create(name: 'manoj')
      user1 = User.create(name: 'someone')
      user2 = User.create(name: 'someoneelse')
      user3 = User.create(name: 'someoeelse')

      review = book.reviews.create(rating: 3,user: user, content: 'this is awesome')
      review1 = book.reviews.create(rating: 3,user: user2, content: 'this is not awesome')
      review2 = book.reviews.create(rating: 3,user: user3, content: 'this is  okey awesome')

      average_rating = (review.rating + review1.rating + review2.rating)/3

      expect(book.average_rating).to eq(average_rating)
    end
  end
end
