require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should get new" do
    log_in_as( @user )
    get new_message_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get messages_path
    assert_redirected_to login_url
  end

end
