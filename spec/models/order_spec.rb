require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'be_longs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'Have tree orders - create_list' do
    # for more orders use create_list(:symbol, qtd)
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    puts customer.inspect
    puts customer.orders.inspect
    expect(customer.orders.count).to eq(5)
  end
end
