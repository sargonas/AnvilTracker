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
  test "should not get index when logged out" do
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
  test "should create User1 print when signed in as User1" do
    sign_in User.first
    assert_difference('Print.count') do
      post :create, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price, volume: @print.volume, user_id: @print.user_id, print_duration: "00:10:12" }
    end
    assert_redirected_to print_path(assigns(:print))
  end
  test "should not create print when logged out" do
    assert_no_difference('Print.count') do
      post :create, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price, volume: @print.volume, user_id: @print.user_id, print_duration: "00:10:12" }
    end
    assert_redirected_to "/users/sign_in"
  end
  test "should show user1 print when User1 signed in" do
    sign_in User.first
    get :show, id: @print
    assert_response :success
  end
  test "should not show User1 print when User2 signed in" do
    sign_in User.second
    get :show, id: @print
    assert_response :redirect
  end
  test "should not show User1 print when logged out" do
    get :show, id: @print
    assert_response :redirect
  end
  test "should get User1 print edit when User1 signed in" do
    sign_in User.first
    get :edit, id: @print
    assert_response :success
  end
  test "should not get User1 print edit when User2 signed in" do
    sign_in User.second
    get :edit, id: @print
    assert_response :redirect
  end
  test "should not get edit when logged out" do
    get :edit, id: @print
    assert_response :redirect
  end
  test "should update User1 print when User1 signed in" do
    sign_in User.first
    patch :update, id: @print, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price, volume: @print.volume, user_id: @print.user_id, print_duration: "00:10:12" }
    assert_redirected_to print_path(assigns(:print))
  end
  test "should not update User1 print when User2 signed in" do
    sign_in User.second
    patch :update, id: @print, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price, volume: @print.volume, user_id: @print.user_id, print_duration: "00:10:12" }
    assert_response :redirect
  end
  test "should not update print when logged out" do
    patch :update, id: @print, print: { name: @print.name, filament_id: @print.filament_id, length: @print.length, weight: @print.weight, price: @print.price, volume: @print.volume }
    assert_redirected_to "/users/sign_in"
  end
  test "should destroy User1 print when User1 signed in" do
    sign_in User.first
    assert_difference('Print.count', -1) do
      delete :destroy, id: @print
    end
    assert_redirected_to prints_path
  end
  test "should not destroy User1 print when User2 signed in" do
    sign_in User.second
    assert_no_difference('Print.count', -1) do
      delete :destroy, id: @print
    end
    assert_response :redirect
  end
  test "should not destroy print when logged out" do
    assert_no_difference('Print.count', -1) do
      delete :destroy, id: @print
    end
    assert_redirected_to "/users/sign_in"
  end
end