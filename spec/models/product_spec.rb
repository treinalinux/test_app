require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  it 'is invalid without description' do
    # the build was used for use in memory, but not create the product register
    product = build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to include("can't be blank")
  end

  context 'Validates' do
    # the shoulda-matchers is simple
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end


  # This comment because use of shoulda-matchers
  # it 'is invalid without price' do
  #   # the build was used for use in memory, but not create the product register
  #   product = build(:product, price: nil)
  #   product.valid?
  #   expect(product.errors[:price]).to include("can't be blank")
  # end

  # it 'is invalid without category' do
  #   # the build was used for use in memory, but not create the product register
  #   product = build(:product, category: nil)
  #   product.valid?
  #   expect(product.errors[:category]).to include("can't be blank")
  # end

  context 'Instance Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
