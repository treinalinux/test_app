require 'rails_helper'

RSpec.describe Customer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # fixtures :customers
  fixtures :all

  it 'Create a Customer' do
    customer = customers(:alan)
    expect(customer.name).to eq('Alan Alves')
  end
end
