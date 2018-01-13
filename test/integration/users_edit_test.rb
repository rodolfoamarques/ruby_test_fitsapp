require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users( :one )
  end

  test "unsuccessful edit" do
    log_in_as( @user )
    get edit_user_path( @user )
    assert_template 'users/edit'
    patch user_path( @user ), params: { user: { name: "", email: "foo@invalid", password: "foo", password_confirmation: "bar", user_type: "hitman" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as( @user )
    get edit_user_path( @user )
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    type = "trainer"
    patch user_path( @user ), params: { user: { name: name, email: email, password: "", password_confirmation: "", user_type: type } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
    assert_equal type, @user.user_type
  end

end
