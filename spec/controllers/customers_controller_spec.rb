require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

  describe 'as a Guest' do
    context '#index' do
      it 'responds a 200 response' do
        get :index
        expect(response).to have_http_status(200)
      end

      # Changes for be_success with error
      # it 'responds successfully' do
      #   get :index
      #   expect(response).to be_success
      # end
      #
    end
    context '#show' do
      it 'responds a 302 response (not authorized)' do
        customer = create(:customer)
        get :show, params: { id: customer.id }
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'as Logged' do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    # Routes with should matchers
    it { is_expected.to route(:get, '/customers').to(action: :index) }

    context '#create' do
      it 'with valid attributes' do
        customer_params = attributes_for(:customer)
        sign_in @member
        expect do
          post :create, params: { customer: customer_params }
        end.to change(Customer, :count).by(1)
      end
      it 'with invalid attributes' do
        customer_params = attributes_for(:customer, address: nil)
        sign_in @member
        expect do
          post :create, params: { customer: customer_params }
        end.not_to change(Customer, :count)
      end
      it 'Flash Notice' do
        customer_params = attributes_for(:customer)
        sign_in @member
        post :create, params: { customer: customer_params }
        expect(flash[:notice]).to match(/successfully created/)
      end

      it 'Content-Type JSON' do
        customer_params = attributes_for(:customer)
        sign_in @member
        post :create, format: :json, params: { customer: customer_params }
        # get :show, format: :json, params: { id: @customer.id }
        # expect(response.content_type).to match(%r{application/json})
        expect(response.content_type).to match(%r{application/json})
      end
    end
    context '#show' do
      it 'responds a 200 response' do
        # member = create(:member)
        # customer = create(:customer)

        sign_in @member

        get :show, params: { id: @customer.id }
        expect(response).to have_http_status(200)
      end
      it 'render a :show template' do
        # member = create(:member)
        # customer = create(:customer)

        sign_in @member

        get :show, params: { id: @customer.id }
        expect(response).to render_template(:show)
      end
    end
  end
end
