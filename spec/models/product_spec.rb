require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a new product' do
      category = Category.new(name: 'test')
      product = Product.new(name: 'test', price: 1000, quantity: 1, category: category)      
      expect(product).to be_valid
    end

    it 'is not valid without a name attribute' do
      category = Category.new(name: 'test')
      product = Product.new(name: nil, price: 1000, quantity: 1, category: category)
      # product.validate      
      # expect(product.errors.full_messages[0]).to eq("Name can't be blank.")
      expect(product).to_not be_valid
    end    

    it 'is not valid without a price attribute' do
      category = Category.new(name: 'test')
      product = Product.new(name: 'test', price: nil, quantity: 1, category: category)
      expect(product).to_not be_valid      
    end

    it 'is not valid without a quantity attribute' do
      category = Category.new(name: 'test')
      product = Product.new(name: 'test', price: 1000, quantity: nil, category: category)
      expect(product).to_not be_valid
    end

    it 'is not valid without a category attribute' do      
      product = Product.new(name: 'test', price: 1000, quantity: 1, category: nil)
      expect(product).to_not be_valid 
    end

  end
end
