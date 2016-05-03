require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should not get index unless logged in" do
    get :index
    assert_response :redirect
  end
  
  test "should get index when logged in" do
    sign_in User.first
    get :index
    assert_response :success
  end
end
