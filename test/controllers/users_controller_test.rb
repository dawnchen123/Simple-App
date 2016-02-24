require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:dawn)
    @other_user = users(:chen)
  end

  test "should redirect following when not logged in" do
    get :following, id: @user
    assert_redirected_to login_url
  end

  test "should redirect followers when not logged in" do
    get :followers, id: @user
    assert_redirected_to login_url
  end



end
