require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path( @user_one )
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path( @user_one ), params: { user: { name: @user_one.name, email: @user_one.email, user_type: @user_one.user_type } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as( @user_two )
    get edit_user_path( @user_one )
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as( @user_two )
    patch user_path( @user_one ), params: { user: { name: @user_one.name, email: @user_one.email, user_type: @user_one.user_type } }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path( @user_one )
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as( @user_two )
    assert_no_difference 'User.count' do
      delete user_path( @user_one )
    end
    assert_redirected_to root_url
  end

end
