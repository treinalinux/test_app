require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds a 200 response' do
    get :index
    expect(response).to have_http_status(200)
  end

  # Changes for be_success with error
  # it 'responds successfully' do
  #   get :index
  #   expect(response).to be_success
  # end
end
