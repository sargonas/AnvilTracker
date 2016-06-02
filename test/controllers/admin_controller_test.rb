require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get admin as an admin" do
    sign_in User.first
    get :home
    assert_response :success
  end
  
  test "should not get admin as a non-admin" do
    sign_in User.second
    get :home
    assert_response :redirect
  end
  
  test "should not get admin when not signed in" do
    get :home
    assert_response :redirect
  end
end