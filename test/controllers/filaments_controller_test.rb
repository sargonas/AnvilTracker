require 'test_helper'

class FilamentsControllerTest < ActionController::TestCase
  setup do
    @filament = filaments(:one)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filaments)
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should create filament" do
    assert_difference('Filament.count') do
      post :create, filament: { name: @filament.name, material: @filament.material, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost }
    end
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should show filament" do
    get :show, id: @filament
    assert_response :success
  end
  test "should get edit" do
    get :edit, id: @filament
    assert_response :success
  end
  test "should update filament" do
    patch :update, id: @filament, filament: { name: @filament.name, material: @filament.material, color: @filament.color, length: @filament.length, weight: @filament.weight, cost: @filament.cost }
    assert_redirected_to filament_path(assigns(:filament))
  end
  test "should destroy filament" do
    assert_difference('Filament.count', -1) do
      delete :destroy, id: @filament
    end
    assert_redirected_to filaments_path
  end
end