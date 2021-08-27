# test/controllers/acts_controller_test.rb
class ActsControllerTest < ActionDispatch::IntegrationTest

  test 'should forbid get index for non-premium user' do
    login users(:expired_advocate)
    get acts_url
    assert_response root_path
  end

  test 'should get index for premium user' do
    login users(:premium_advocate)
    get acts_url
    assert_response :success
  end

  # ...
end
