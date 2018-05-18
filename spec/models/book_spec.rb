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

      review = book.reviews.create(user: user, content: 'this is awesome')
      rating = book.ratings.create(user: user, rating: 3)
      rating1 = book.ratings.create(user: user1, rating: 4)
      rating2 = book.ratings.create(user: user2, rating: 5)

      average_rating = (rating.rating + rating1.rating + rating2.rating)/3


      expect(Book.average_rating).to eq(average_rating)
    end
  end
end
