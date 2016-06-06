require 'test_helper'

class FilamentsControllerTest < ActionController::TestCase
  setup do
    @filament = filaments(:one)
    @material = materials(:one)
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
  test "should create User1 filament when signed in as user 1" do
    sign_in User.first
    assert_difference('Filament.count') do
      post :create, filament: { name: @filament.name, material_id: @filament.material_id, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost, diameter: @filament.diameter, archived: @filament.archived, user_id: '1' }
    end
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should not create filament when signed out" do
    assert_no_difference('Filament.count') do
      post :create, filament: { name: @filament.name, material_id: @filament.material_id, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost, diameter: @filament.diameter, archived: @filament.archived, user_id: '1' }
    end
    assert_redirected_to "/users/sign_in"
  end
  test "should show User1 filament when signed in as User1" do
    sign_in User.first
    get :show, id: @filament
    assert_response :success
  end
  test "should not show User1 filament when signed in as User2" do
    sign_in User.second
    get :show, id: @filament
    assert_response :redirect
  end
  test "should not show filament when signed out" do
    get :show, id: @filament
    assert_response :redirect
  end
  test "should get edit for User1 filament when signed in as User1" do
    sign_in User.first
    get :edit, id: @filament
    assert_response :success
  end
  test "should not get edit for User 1 filament when signed in as User2" do
    sign_in User.second
    get :edit, id: @filament
    assert_response :redirect
  end
  test "should not get edit when signed out" do
    get :edit, id: @filament
    assert_response :redirect
  end
  test "should update User1 filament when signed in as User1" do
    sign_in User.first
    patch :update, id: @filament, filament: { name: @filament.name, material_id: @filament.material_id, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost, diameter: @filament.diameter, archived: @filament.archived }
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should not update User1 filament when signed in as User2" do
   sign_in User.second
    patch :update, id: @filament, filament: { name: @filament.name, material_id: @filament.material_id, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost, diameter: @filament.diameter, archived: @filament.archived }
    assert_response :redirect
  end
  test "should not update filament when signed out" do
    patch :update, id: @filament, filament: { name: @filament.name, material_id: @filament.material_id, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost, diameter: @filament.diameter, archived: @filament.archived }
    assert_redirected_to "/users/sign_in"
  end
  test "should destroy User1 filament when signed in as User1" do
    sign_in User.first
    assert_difference('Filament.count', -1) do
      delete :destroy, id: @filament
    end
    assert_redirected_to filaments_path
  end
  test "should not destroy User1 filament when signed in as User2" do
    sign_in User.second
    assert_no_difference('Filament.count', -1) do
      delete :destroy, id: @filament
    end
    assert_response :redirect
  end
  test "should not destroy filament when signed out" do
    assert_no_difference('Filament.count', -1) do
      delete :destroy, id: @filament
    end
    assert_redirected_to "/users/sign_in"
  end
end