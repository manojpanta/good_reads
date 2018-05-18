require 'rails_helper'

describe 'when user visits book show path' do
  scenario 'can  see title' do
    book = Book.create(title: 'book')

    visit book_path(book)
    expect(page).to have_content(book.title)
  end

  scenario 'can  see title' do
    book = Book.create(title: 'book')
    user = User.create(name: 'manoj')
    review = book.reviews.create(user: user, content: 'this is awesome')
    ratings = book.ratings.create(user: user, rating: 3)

    visit book_path(book)
    expect(page).to have_content(book.title)
    expect(page).to have_content(review.content)
    expect(page).to have_content(review.user.name)
  end
end
