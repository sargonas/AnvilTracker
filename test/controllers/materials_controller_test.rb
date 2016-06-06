require 'test_helper'

class MaterialsControllerTest < ActionController::TestCase
  setup do
    @material = materials(:one)
  end
  test "should get index when signed in" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:materials)
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
  test "should create User1 material when signed in as user 1" do
    sign_in User.first
    assert_difference('Material.count') do
      post :create, material: { name: @material.name, manufacturer: @material.manufacturer, description: @material.description, extruder_temp: @material.extruder_temp, bed_temp: @material.bed_temp, notes: @material.notes, density: @material.density, user_id: '1' }
    end
    assert_redirected_to material_path(assigns(:material))
  end
  test "should not create material when signed out" do
    assert_no_difference('Material.count') do
      post :create, material: { name: @material.name, manufacturer: @material.manufacturer, description: @material.description, extruder_temp: @material.extruder_temp, bed_temp: @material.bed_temp, notes: @material.notes, density: @material.density, user_id: '1' }
    end
    assert_redirected_to "/users/sign_in"
  end
  test "should show User1 material when signed in as User1" do
    sign_in User.first
    get :show, id: @material
    assert_response :success
  end
  test "should not show User1 material when signed in as User2" do
    sign_in User.second
    get :show, id: @material
    assert_response :redirect
  end
  test "should not show material when signed out" do
    get :show, id: @material
    assert_response :redirect
  end
  test "should get edit for User1 material when signed in as User1" do
    sign_in User.first
    get :edit, id: @material
    assert_response :success
  end
  test "should not get edit for User 1 material when signed in as User2" do
    sign_in User.second
    get :edit, id: @material
    assert_response :redirect
  end
  test "should not get edit when signed out" do
    get :edit, id: @material
    assert_response :redirect
  end
  test "should update User1 material when signed in as User1" do
    sign_in User.first
    patch :update, id: @material, material: { name: @material.name, manufacturer: @material.manufacturer, description: @material.description, extruder_temp: @material.extruder_temp, bed_temp: @material.bed_temp, notes: @material.notes, density: @material.density }
    assert_redirected_to material_path(assigns(:material))
  end
  test "should not update User1 material when signed in as User2" do
   sign_in User.second
    patch :update, id: @material, material: { name: @material.name, manufacturer: @material.manufacturer, description: @material.description, extruder_temp: @material.extruder_temp, bed_temp: @material.bed_temp, notes: @material.notes, density: @material.density }
    assert_response :redirect
  end
  test "should not update material when signed out" do
    patch :update, id: @material, material: { name: @material.name, manufacturer: @material.manufacturer, description: @material.description, extruder_temp: @material.extruder_temp, bed_temp: @material.bed_temp, notes: @material.notes, density: @material.density }
    assert_redirected_to "/users/sign_in"
  end
  test "should destroy User1 material when signed in as User1" do
    sign_in User.first
    assert_difference('Material.count', -1) do
      delete :destroy, id: @material
    end
    assert_redirected_to materials_path
  end
  test "should not destroy User1 material when signed in as User2" do
    sign_in User.second
    assert_no_difference('Material.count', -1) do
      delete :destroy, id: @material
    end
    assert_response :redirect
  end
  test "should not destroy material when signed out" do
    assert_no_difference('Material.count', -1) do
      delete :destroy, id: @material
    end
    assert_redirected_to "/users/sign_in"
  end
end