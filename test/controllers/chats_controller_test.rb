require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get chatlist_path
    assert_response :success
  end

end
