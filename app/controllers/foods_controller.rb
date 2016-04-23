class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update]

  def index
    @search_items = Food.search_by_name(params[:query]).to_a # returns an array of foods with this name
    @foods = Food.all
    if @foods.empty?
      @foods = [NullFood.new]
    else
      @foods = Food.alphabetical.paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.html
      format.json { @search_items = Food.search_by_name(params[:query]).to_a }
    end
  end

  def new
  end

  def show
    @enviro_types = @food.enviro_types
    @nutri_attributes = @food.nutri_attributes
  end

  def search_results
    @search_items = Food.search_by_name(params[:query]).to_a # returns an array of foods with this name
  end

  def search
    # Get foods saved in session
    @foods = get_foods_from_session
    # Make a plate with those foods
    @plate = make_plates_from_foods("my_plate", @foods)
    # Handle formats
    respond_to do |format|
      format.html
      format.json { @foods = Food.search(params[:term]) }
    end
  end

  def search_add
    food = Food.find_by_name(params[:food_name])
    session[:chosen_foods] ||= Array.new
    session[:chosen_foods] << food
    redirect_to search_path
  end

  def deselect_food
    food = Food.find(params[:id])
    session[:chosen_foods].delete food.attributes
    redirect_to search_path
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food, notice: "Successfully created #{@food.name}"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food), notice: "Successfully updated #{@food.name}"
    else
      render action: 'edit'
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, notice: "Successfully removed #{@food.name}"
  end

  def import
    if params[:file].nil?
      redirect_to foods_path, notice: "Please upload a csv file."
    else
      # add methods to truncate tables
      # add them here!
      Food.delete_all
      importer = Importer.new(params[:file])
      importer.import_csv_data
      redirect_to foods_path, notice: "Foods Added Successfully through CSV"
    end
  end


  private 

  def set_food
    @food = Food.find(params[:id])
    if @food.nil?
      @food = NullFood.new
    end
  end

  def food_params
    params.require(:food).permit(:name, :serving_description, :total_calories, :total_kg, :active, :file, :query)
  end

  def get_foods_from_session
    foods = Array.new
    unless session[:chosen_foods].nil?
      session[:chosen_foods].each do |data|
        food = Food.new(data)
        foods << food
      end
    end
    return foods
  end

  def make_plates_from_foods(name, foods)
    plate = Plate.new(name)
    food_hash = Hash.new
    foods.each do |food|
      food_hash[food] = 1
    end
    plate.foods = food_hash
    return plate
  end

end
