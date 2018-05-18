require 'rails_helper'

describe 'when user visits book show path' do
  scenario 'can  see title' do
    book = Book.create(title: 'book')
    user = User.create(name: 'manoj')
    review = book.reviews.create(user: user, content: 'this is awesome')

    visit book_path(book)
    expect(page).to have_content(book.title)
  end

  scenario 'can  see title, reviews and rating' do
    book = Book.create(title: 'book')
    user = User.create(name: 'manoj')
    review = book.reviews.create(user: user, content: 'this is awesome')

    visit book_path(book)
    expect(page).to have_content(book.title)
    expect(page).to have_content(review.content)
    expect(page).to have_content(review.user.name)
    expect(page).to have_content(review.rating)
  end

  scenario 'can  see average rating' do
    book = Book.create(title: 'book')
    user1 = User.create(name: 'manoj')
    user2 = User.create(name: 'someone')
    user3 = User.create(name: 'someoneelse')


    review = book.reviews.create(rating: 3, user: user1, content: 'this is awesome')
    review1 = book.reviews.create(rating: 4,user: user2, content: 'this is not awesome')
    review2 = book.reviews.create(rating: 5,user: user3, content: 'this is  okey awesome')

    visit book_path(book)

    average_rating = (review.rating + review1.rating + review2.rating)/3

    expect(page).to have_content(average_rating)
  end

  scenario 'can see top rating' do
    book = Book.create(title: 'book')
    user1 = User.create(name: 'manoj')
    user2 = User.create(name: 'someone')
    user3 = User.create(name: 'someoneelse')


    review = book.reviews.create(rating: 3, user: user1, content: 'this is awesome')
    review1 = book.reviews.create(rating: 4,user: user2, content: 'this is not awesome')
    review2 = book.reviews.create(rating: 5,user: user3, content: 'this is  okey awesome')

    visit book_path(book)

    top_rating = "Highest Rating: #{review2.rating}"
    low_rating = "Lowest Rating: #{review.rating}"
    top_review = "Top Review: #{review2.content}"
    top_reviewer = "Top reviewer: #{review2.user.name}"

    expect(page).to have_content(top_rating)
    expect(page).to have_content(low_rating)
    expect(page).to have_content(top_review)
    expect(page).to have_content(top_reviewer)
  end
  scenario 'can see low rating' do
    book = Book.create(title: 'book')
    user1 = User.create(name: 'manoj')
    user2 = User.create(name: 'someone')
    user3 = User.create(name: 'someoneelse')


    review = book.reviews.create(rating: 3, user: user1, content: 'this is awesome')
    review1 = book.reviews.create(rating: 4,user: user2, content: 'this is not awesome')
    review2 = book.reviews.create(rating: 5,user: user3, content: 'this is  okey awesome')

    visit book_path(book)

    low_rating = "Lowest Rating: #{review.rating}"
    low_review = "Low Review: #{review.content}"
    low_reviewer = "Low reviewer: #{review.user.name}"

    expect(page).to have_content(low_rating)
    expect(page).to have_content(low_review)
    expect(page).to have_content(low_reviewer)
  end
end
