require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Have a order' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Have tree orders' do
    # for more orders use create_list(:symbol, qtd)
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end
end
