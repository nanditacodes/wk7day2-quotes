require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  def test_user_is_required
    quote = Quote.new
    quote.save
    assert_equal true, quote.errors[:user].any?
  end

  def test_body_is_required
    quote = Quote.new
    quote.save
    assert_equal true, quote.errors[:user].any?
  end
end
