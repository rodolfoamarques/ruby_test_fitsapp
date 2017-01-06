require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "some_pass", password_confirmation: "some_pass", user_type: "user")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "user_type should be present" do
    @user.user_type = ""
    assert_not @user.valid?
  end

  test "user_type should not be too long" do
    @user.user_type = "big_user_type"
    assert_not @user.valid?
  end

  test "user_type validation should accept valid user_types" do
    valid_user_types = %w[user trainer]
    valid_user_types.each do |valid_user_type|
      @user.user_type = valid_user_type
      assert @user.valid?, "#{valid_user_type.inspect} should be valid"
    end
  end

  test "user_type validation should reject invalid user_types" do
    invalid_user_types = %w[this that other]
    invalid_user_types.each do |invalid_user_type|
      @user.user_type = invalid_user_type
      assert_not @user.valid?, "#{invalid_user_type.inspect} should be invalid"
    end
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "really really really really really really really really really really really super ultra mega long name"
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "reallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallyreallysuperultramegaloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong@email.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com BIG_USER@BAR.COM S0M3-US_ER@foo.dot a.b@foo.bar]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com this_user_at_foo.bar user.name@example. foo@bar_user.name this@that+other.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "pass"
    assert_not @user.valid?
  end

end
