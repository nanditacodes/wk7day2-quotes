
require 'test_helper'

class SearchForQuotes < ActionDispatch::IntegrationTest

  def test_can_search_for_message
    bill = create_user("bill")
    visit root_path

    bill.quotes.create(body: 'xyz should show')
    bill.quotes.create(body: 'abc should not show')

    within("#new_user") do
      fill_in 'Email', :with => bill.email
      fill_in 'Password', :with => "password"
      click_button "Sign in"
    end

    within(".search-form") do
      fill_in 'body', with: 'xyz'
      click_button 'submit-search'
    end

    save_and_open_page
    assert page.has_content?("xyz"), "XYZ should have shown on page"
    assert !page.has_content?("abc"), "ABC should not have shown"

  end


end
