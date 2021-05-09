require 'rails_helper'

RSpec.describe Customer, type: :model do
  # Only examples of use fixtures
  # fixtures :customers
  # fixtures :all
  # use factorybot instead of fixtures

  it 'Create a Customer' do
    # line used when use fixtures
    # customer = customers(:alan)
    customer = create(:customer)
    expect(customer.name).to start_with('')
  end

  it { expect { create(:customer) }.to change{ Customer.all.size }.by(1) }
end
