require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user=User.new(name: "Example user" , email: "user@example.com")
  end
  
  test "should be valid" do
  assert @user.valid?
  end

  test "name should be present" do
    @user.name =""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email=""
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 50
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email ="a"* + 50 + "example.com"
    assert_not @user.valid?
  end



  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
    
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  


end
