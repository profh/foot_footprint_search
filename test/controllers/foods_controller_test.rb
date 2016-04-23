require 'test_helper'

class FoodsControllerTest < ActionController::TestCase
  setup do
    create_foods
  end

  teardown do
    destroy_foods
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foods) # ensures that a @foods instance variable was set
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: @apple
    assert_response :success
    assert_not_nil assigns(:food) # has a @food object
  end

  test "should create a new food" do
    assert_difference('Food.count') do # make sure difference in number of foods
      post :create, food: { active: true, name: "beans", food_description: "A can of black beans", serving_description: "1 can" }
    end
    assert_redirected_to food_path(assigns(:food)) # after create new food, goes to __ page
    assert_equal "Successfully created beans", flash[:notice] # flash message, can remove/change
    post :create, food: { active: true, name: nil, serving_description: "1 can" } # invalid bc name can't be nil..
    assert_template :new # ..so redirect to new template
  end

  test "should get edit" do
    get :edit, id: @apple
    assert_not_nil assigns(:food)
    assert_response :success
  end

  test "should update a food" do
    patch :update, id: @apple, food: { active: @apple.active, name: @apple.name, serving_description: "1 small apple" }
    assert_redirected_to food_path(assigns(:food))
    assert_equal "Successfully updated apple", flash[:notice]
    patch :update, id: @apple, food: { active: @apple.active, name: nil, serving_description: "1 small apple" }
    assert_template :edit 
  end

  test "should destroy a food" do
    assert_difference('Food.count', -1) do # ensure number of foods decrease by 1
      delete :destroy, id: @apple
    end
    assert_redirected_to foods_path
    assert_equal "Successfully removed apple", flash[:notice]
  end

end
