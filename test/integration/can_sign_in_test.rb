require 'test_helper'

class CanSignInTest < ActionDispatch::IntegrationTest

  def test_can_sign_in

    test = create_user("test")
    visit root_path
    within ("#new_user") do
      fill_in('Email', with: test.email)
      fill_in('Password', with: "password")
      click_button("Sign in")
    end

    assert page.has_content?('Quotes')

  end


end
