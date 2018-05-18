require 'rails_helper'

describe 'when user visits book show path' do
  scenario 'can  see title' do
    book = Book.create(title: 'book')

    visit book_path(book)
    expect(page).to have_content(book.title)
  end

  scenario 'can  see title, reviews and rating' do
    book = Book.create(title: 'book')
    user = User.create(name: 'manoj')
    review = book.reviews.create(user: user, content: 'this is awesome')
    rating = book.ratings.create(user: user, rating: 3)

    visit book_path(book)
    expect(page).to have_content(book.title)
    expect(page).to have_content(review.content)
    expect(page).to have_content(review.user.name)
    expect(page).to have_content(rating.rating)
  end
  scenario 'can  average rating' do
    book = Book.create(title: 'book')
    user = User.create(name: 'manoj')
    user1 = User.create(name: 'someone')
    user2 = User.create(name: 'someoneelse')

    visit book_path(book)
    review = book.reviews.create(user: user, content: 'this is awesome')
    rating = book.ratings.create(user: user, rating: 3)
    rating1 = book.ratings.create(user: user1, rating: 4)
    rating2 = book.ratings.create(user: user2, rating: 5)

    average_rating = (rating.rating + rating1.rating + rating2.rating)/3

    expect(page).to have_content(average_rating)
  end
end
