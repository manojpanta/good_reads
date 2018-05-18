require 'rails_helper'

describe Rating do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a rating' do
        rating = Rating.new()
        expect(rating).to be_invalid
      end
    end
  end
end
