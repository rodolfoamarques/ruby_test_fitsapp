require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @user_one = users(:one)
    @user_two = users(:two)
    @message = @user.messages.build( message: "Lorem ipsum", to_user_id: @user_two.id )
  end

  test "should be valid" do
    assert @message.valid?
  end

  test "from_user_id should be present" do
    @message.from_user_id = nil
    assert_not @message.valid?
  end

  test "to_user_id should be present" do
    @message.to_user_id = nil
    assert_not @message.valid?
  end

  test "message should be present" do
    @message.message = ""
    assert_not @message.valid?
  end

  test "order should be most recent first" do
    assert_equal messages( :five ), Message.first
  end

end
