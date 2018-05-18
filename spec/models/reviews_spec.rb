require 'rails_helper'

describe Review do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without a content' do
        review= Review.new()
        expect(review).to be_invalid
      end
    end
  end
end
