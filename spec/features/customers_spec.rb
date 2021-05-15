require 'rails_helper'

RSpec.feature 'Customers', type: :feature, js: true do
  it 'Visit index page' do
    visit(customers_path)
    # print page.html - print in terminal
    # save_and_open_page - save html on nome_project/tmp/capybara/capybara-11.html
    # page.save_screenshot('screenshot.png')
    page.save_and_open_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end
end
