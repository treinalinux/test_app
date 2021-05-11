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
    # Show a sequence how example
    # puts customer.email
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

  it 'use attributes_for' do
    attrs1 = attributes_for(:customer)
    attrs2 = attributes_for(:customer_vip)
    attrs3 = attributes_for(:customer_default)
    puts attrs1
    puts attrs2
    puts attrs3
  end

  it 'Attribute trasient' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Client Female' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
  end

  it 'Client Female Default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
  end

  it 'Client Male' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
  end

  it 'Client Male Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it { expect { create(:customer) }.to change{ Customer.all.size }.by(1) }
end
