require 'test_helper'

class MessagesNewTest < ActionDispatch::IntegrationTest

  def setup
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "invalid new message information" do
    log_in_as( @user_one )
    get new_message_path
    assert_no_difference 'Message.count' do
      post messages_path, params: { message: { message: "", from_user_id: "", to_user_id: "" } }
    end
    assert_template 'messages/new'
  end

  test "valid new message information" do
    log_in_as( @user_one )
    get new_message_path
    assert_difference 'Message.count', 1 do
      post messages_path, params: { message: { message: "Lorem Ipsum Sit Dommet", from_user_id: @user_one.id, to_user_id: @user_two.id } }
    end
    follow_redirect!
    assert_template 'messages/index'
  end

end
