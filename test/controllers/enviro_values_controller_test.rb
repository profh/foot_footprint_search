require 'test_helper'

class EnviroValuesControllerTest < ActionController::TestCase

  setup do
    create_foods
    create_enviro_types
    create_enviro_values
  end

  teardown do
    destroy_foods
    create_enviro_types
    destroy_enviro_values
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enviro_values) #  ensures that an @enviro_values instance variable was set
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @apple_energy_total
    assert_response :success
    assert_not_nil assigns(:enviro_value)
  end

  test "should create a new enviro value" do
    assert_difference('EnviroValue.count') do
    post :create, enviro_value: { food: @apple, enviro_type: @energy.id, value: 3.2 }
    end
    assert_redirected_to enviro_values_path
    # assert_equal "Maybe flash message", flash[:notice]
    post :create, enviro_value: { food: @apple, enviro_type: @energy.id, value: nil }
    #* \/ uncomment when models validates presence of food or enviro_type
    #* post :create, enviro_value: { food: nil, enviro_type: @energy.id, value: 3.2 }
  end

  test "should get edit" do
    get :edit, id: @apple_energy_total
    assert_not_nil assigns(:enviro_value)
    assert_response :success
  end

  test "should update an enviro value" do 
    # updating so it's 2 MJ in apple not 1
    patch :update, id: @apple_energy_total, enviro_value: { food: @apple, enviro_type_id: @energy, value: 2 }
    assert_redirected_to enviro_values_path
    # assert_equal "Optional flash message", flash[:notice]
    #* patch :update, id: @apple_energy_total, enviro_value: { food: nil, enviro_type_id: @energy, value: 2 }
    #* assert_template :edit
  end

  test "should destroy an enviro value" do
    assert_difference('EnviroValue.count', -1) do
      delete :destroy, id: @apple_energy_total
    end
    assert_redirected_to enviro_values_path
    # assert_equal "Flash message?", flash[:notice]
  end

end
