require 'test_helper'

class PrintsControllerTest < ActionController::TestCase
 setup do
    @print = prints(:one)
    @filament = filaments(:one)
  end
  test "should get index when signed in" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:prints)
  end
  test "should note get index when logged out" do
    get :index
    assert_response :redirect
  end
  test "should get new when signed in" do
    sign_in User.first
    get :new
    assert_response :success
  end
  test "should not get new when logged out" do
    get :new
    assert_response :redirect
  end
  test "should create print when signed in" do
    sign_in User.first
    assert_difference('Print.count') do
      post :create, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price }
    end
    assert_redirected_to print_path(assigns(:print))
  end
  test "should not create print when logged out" do
    #Needs future test condition
  end
  test "should show print when signed in" do
    sign_in User.first
    get :show, id: @print
    assert_response :success
  end
  test "should not show print when logged out" do
    get :show, id: @print
    assert_response :redirect
  end
  test "should get edit when signed in" do
    sign_in User.first
    get :edit, id: @print
    assert_response :success
  end
  test "should not get edit when logged out" do
    get :edit, id: @print
    assert_response :redirect
  end
  test "should update print when signed in" do
    sign_in User.first
    patch :update, id: @print, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price }
    assert_redirected_to print_path(assigns(:print))
  end
  test "should not update print when logged out" do
    #Needs future test condition
  end
  test "should destroy print when signed in" do
    sign_in User.first
    assert_difference('Print.count', -1) do
      delete :destroy, id: @print
    end
    assert_redirected_to prints_path
  end
  test "should not destroy print when logged out" do
    #Needs future test condition
  end
end
