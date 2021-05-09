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

  it 'Overwrite Attribute' do
    # the user is an alias of customer
    customer = create(:user, name: 'Alan Alves')
    expect(customer.name).to eq('Alan Alves')
  end

  # inheritance with FactoryBot
  it 'Vip true' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  # inheritance with FactoryBot
  it 'Vip false' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it { expect { create(:customer) }.to change{ Customer.all.size }.by(1) }
end
