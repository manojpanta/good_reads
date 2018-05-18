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
end
