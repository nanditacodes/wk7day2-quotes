require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new
  end

  def test_name_is_required
    @user.valid?
    assert_equal true, @user.errors[:name].any?
  end

end
