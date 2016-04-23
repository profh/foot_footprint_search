require 'test_helper'

class NutriAttributesControllerTest < ActionController::TestCase

  setup do
    create_nutri_attributes
  end

  teardown do
    destroy_nutri_attributes
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutri_attributes) # ensures that a @nutri_attributes instance variable was set
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @total_fat_kg
    assert_response :success
    assert_not_nil assigns(:nutri_attribute)
  end

  test "should create a new nutri attribute" do
    assert_difference('NutriAttribute.count') do 
      post :create, nutri_attribute: { active: true, name: "total fat", units: "g" }
    end
    assert_redirected_to nutri_attribute_path(assigns(:nutri_attribute)) 
    # assert_equal "Successfully created total fat in g", flash[:notice] 
    post :create, nutri_attribute: { active: true, name: nil, units: "g" } 
    assert_template :new 
  end

  test "should get edit" do
    get :edit, id: @total_fat_kg
    assert_not_nil assigns(:nutri_attribute)
    assert_response :success
  end

  test "should update a nutri attribute" do
    # update total fat in kg to total fat in g
    patch :update, id: @total_fat_kg, nutri_attribute: { active: @total_fat_kg.active, name: @total_fat_kg.name, units: "g" }
    assert_redirected_to nutri_attribute_path(assigns(:nutri_attribute))
    # assert_equal "Successfully updated total fat", flash[:notice]
    patch :update, id: @total_fat_kg, nutri_attribute: { active: @total_fat_kg.active, name: nil, units: "kg" }
    assert_template :edit 
  end

  test "should destroy a nutri attribute" do
    assert_difference('NutriAttribute.count', -1) do 
      delete :destroy, id: @total_fat_kg
    end
    assert_redirected_to nutri_attributes_path
    # assert_equal "Successfully removed total fat in kg", flash[:notice]
  end

end
