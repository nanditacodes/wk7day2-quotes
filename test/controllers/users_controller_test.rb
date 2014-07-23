require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  def test_user_successfully_authenticated
    my_user = create_user("new")

    sign_in :user, my_user
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

end
