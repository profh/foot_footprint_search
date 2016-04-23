require 'test_helper'

class NutriValuesControllerTest < ActionController::TestCase

  setup do
    create_foods
    create_nutri_attributes
    create_nutri_values
  end

  teardown do
    destroy_foods
    destroy_nutri_attributes
    destroy_nutri_values
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nutri_values) # ensures that a @nutri_values instance variable was set
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @apple_total_fat
    assert_response :success
    assert_not_nil assigns(:nutri_value)
  end

  test "should create a new nutri value" do
    assert_difference('NutriValue.count') do
      post :create, nutri_value: { nutri_attribute: @total_fat.id, food: @apple.id, value: 0.2 }
    end
    assert_redirected_to nutri_values_path
    # assert_equal "Do we want a flash here?", flash[:notice]
    post :create, nutri_value: { nutri_attribute: @total_fat.id, food: @apple.id, value: nil }
    #* \/ uncomment when models validates presence of nutri_attribute or food
    #* post :create, nutri_value: { nutri_attribute: nil, food: @apple.id, value: 0.2 }
    assert_template :new
  end

  test "should get edit" do
    get :edit, id: @apple_total_fat
    assert_not_nil assigns(:nutri_value)
    assert_response :success
  end

  test "should update a nutri value" do 
    # updating so it's 5 g in apple not 1.0 g
    patch :update, id: @apple_total_fat, nutri_value: { nutri_attribute_id: @total_fat, food: @apple.id, value: 5 }
    assert_redirected_to nutri_values_path
    assert_equal "Nutrition value for Total Fat in apple is updated", flash[:notice]
    #* patch :update, id: @apple_total_fat, nutri_value: { nutri_attribute_id: nil, food: @apple.id, value: 5 }
    #* assert_template :edit
  end

  test "should destroy a nutri value" do
    assert_difference('NutriValue.count', -1) do
      delete :destroy, id: @apple_total_fat
    end
    assert_redirected_to nutri_values_path
    # assert_equal "Flash message?", flash[:notice]
  end

end
