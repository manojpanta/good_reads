require 'rails_helper'

describe 'when user visits book show path' do
  scenario 'can  see title and reviews' do
    book = Book.create(title: 'book')


    visit book_path


    expect(page).to have_content(book.name)
  end

end
