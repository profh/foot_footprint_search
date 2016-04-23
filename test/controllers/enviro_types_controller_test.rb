require 'test_helper'

class EnviroTypesControllerTest < ActionController::TestCase

  setup do
    create_enviro_types
  end

  teardown do
    destroy_enviro_types
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enviro_types) # ensures that a @enviro_types instance variable was set
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @energy
    assert_response :success
    assert_not_nil assigns(:enviro_type)
  end

  test "should create a new enviro type" do
    assert_difference('EnviroType.count') do 
      post :create, enviro_type: { active: true, name: "energy", units: "MJ/g" }
    end
    assert_redirected_to enviro_type_path(assigns(:enviro_type)) 
    # assert_equal "Successfully created __", flash[:notice] 
    post :create, enviro_type: { active: true, name: nil, units: "MJ/kg" } 
    assert_template :new 
  end

  test "should get edit" do
    get :edit, id: @energy
    assert_not_nil assigns(:enviro_type)
    assert_response :success
  end

  test "should update an enviro_type" do
    # update units from MJ/kg to MJ/g
    patch :update, id: @energy, enviro_type: { active: @energy.active, name: "energy", units: "MJ/g" }
    assert_redirected_to enviro_type_path(assigns(:enviro_type))
    patch :update, id: @energy, enviro_type: { active: @energy.active, name: nil, units: "MJ/g" }
    assert_template :edit 
  end

  test "should destroy an enviro_type" do
    assert_difference('EnviroType.count', -1) do 
      delete :destroy, id: @energy
    end
    assert_redirected_to enviro_types_path
  end

end
