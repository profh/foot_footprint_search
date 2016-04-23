class NutriValuesController < ApplicationController
before_action :set_nutri_value, only: [:show, :edit, :update, :destroy]

  def index
    @nutri_values = NutriValue.all
    if @nutri_values.empty?
      @nutri_values = [NullNutriValue.new]
    end
  end

  def new
  end

  def show
  end

  def create
    @nutri_value = NutriValue.new(nutri_value_params)
    if @nutri_value.save
      redirect_to nutri_values_path #, notice: "Potential message?"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @nutri_value.update(nutri_value_params)
      redirect_to nutri_values_path, notice: "Nutrition value for #{@nutri_value.nutri_attribute.name} in #{@nutri_value.food.name} is updated"
    else
      render action: 'edit'
    end
  end

  def destroy
    @nutri_value.destroy
    redirect_to nutri_values_path #, notice: "Flash message?"
  end

  private

  def set_nutri_value
    @nutri_value = NutriValue.find(params[:id])
    if @nutri_value.nil?
      @nutri_value = NullNutriValue.new
    end
  end

  def nutri_value_params
    params.require(:nutri_value).permit(:food_id, :nutri_attribute_id, :value)
  end
end
