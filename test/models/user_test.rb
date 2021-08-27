require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should offer one month premium to user' do
  user = User.create!(
    premium_until: (Date.today + 5.days)
    # ...
  )

  assert_equal (Date.today + 1.month + 5.days), user.premium_until
end

  test 'should set correct premium_until for never premium user' do
    user = User.new
    user.increment_premium
    assert_equal (Date.today + 1.month), user.premium_until
  end

  test 'should set correct premium_until for past-premium user' do
    user = User.new(premium_until: (Date.today - 1.year))
    user.increment_premium
    assert_equal (Date.today + 1.month), user.premium_until
  end


end
