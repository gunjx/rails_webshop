require 'rails_helper'

describe Product do

  context 'when product has comments' do
    let(:product) { Product.create!(name: 'hipster food') }
    let(:user) { User.create!(email: 'joe@example.com', password: 'qwertz') }
    before do
      product.comments.create!(rating: 1, user: user, body: 'Awful product!')
      product.comments.create!(rating: 3, user: user, body: 'OK product!')
      product.comments.create!(rating: 5, user: user, body: 'Great product!')
    end

    it 'returns the average rating of all comments' do
      expect(product.average_rating).to eq 3
    end
  end

  context 'when product does not have required attributes' do

    it 'is not valid without a name' do
      expect(Product.new(description: 'Test Description')).not_to be_valid
    end

    it 'is valid with a name' do
      expect(Product.new(name: 'Test Product')).to be_valid
    end
  end
end
