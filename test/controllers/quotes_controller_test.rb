require 'test_helper'

class QuotesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def test_make_user_sign_in_first
    get  :index
    assert_response  :redirect
  end

  def test_post_sign_in_redirects_to_root_successfully
    user1 = create_user("me")
    sign_in :user, user1
    get :index
    assert_response :success
  end

  def test_view_rendered_is_the_quotes_view
    user1 = create_user("me")
    sign_in :user, user1
    get :index
    assert_select 'div.panel-heading', "#{user1.name}'s Quotes"
  end

  def test_view_has_signed_in_user_quotes
    user1 = create_user("me")
    my_quote = Quote.create!(user: user1, body: Quoth.get)

    sign_in :user, user1
    get :index
    assert_response :success
    assert_equal user1.quotes, assigns(:quotes)

  end

end
