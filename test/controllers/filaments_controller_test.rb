require 'test_helper'

class FilamentsControllerTest < ActionController::TestCase
  setup do
    @filament = filaments(:one)
  end
  test "should get index when signed in" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:filaments)
  end
  test "should not get index when signed out" do
    get :index
    assert_response :redirect
  end
  test "should get new when signed in" do
    sign_in User.first
    get :new
    assert_response :success
  end
  test "should not get new when signed out" do
    get :new
    assert_response :redirect
  end
  test "should create filament when signed in" do
    sign_in User.first
    assert_difference('Filament.count') do
      post :create, filament: { name: @filament.name, material: @filament.material, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost }
    end
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should not create filament when signed out" do
    #future test required
  end
  test "should show filament when signed in" do
    sign_in User.first
    get :show, id: @filament
    assert_response :success
  end
  test "should not show filament when signed out" do
    get :show, id: @filament
    assert_response :redirect
  end
  test "should get edit when signed in" do
    sign_in User.first
    get :edit, id: @filament
    assert_response :success
  end
  test "should not get edit when signed out" do
    get :edit, id: @filament
    assert_response :redirect
  end
  test "should update filament when signed in" do
    sign_in User.first
    patch :update, id: @filament, filament: { name: @filament.name, material: @filament.material, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost }
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should not update filament when signed out" do
    #future test required
  end
  test "should destroy filament when signed in" do
    sign_in User.first
    assert_difference('Filament.count', -1) do
      delete :destroy, id: @filament
    end
    assert_redirected_to filaments_path
  end
  test "should not destroy filament when signed out" do
    #future test required
  end
end