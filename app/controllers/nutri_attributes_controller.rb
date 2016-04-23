class NutriAttributesController < ApplicationController
  before_action :set_nutri_attribute, only: [:show, :edit, :update, :destroy]

  def index
    @nutri_attributes = NutriAttribute.all
    if @nutri_attributes.empty?
      @nutri_attributes = [NullNutriAttribute.new]
    end
  end

  def new
  end

  def show
  end

  def create
    @nutri_attribute = NutriAttribute.new(nutri_attribute_params)
    if @nutri_attribute.save
      redirect_to nutri_attribute_path(@nutri_attribute) #, notice: "Successfully created #{@nutri_attribute.name}" # want flash message or not?
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @nutri_attribute.update(nutri_attribute_params)
      redirect_to nutri_attribute_path(@nutri_attribute) #, notice: "Successfully updated #{@nutri_attribute.name}"
    else
      render action: 'edit'
    end
  end

  def destroy
    @nutri_attribute.destroy
    redirect_to nutri_attributes_path #, notice: "Successfully removed #{@nutri_attribute.name} in #{@nutri_attribute.units}"
  end

  private 

  def set_nutri_attribute
    @nutri_attribute = NutriAttribute.find(params[:id])
    if @nutri_attribute.nil?
      @nutri_attribute = NullNutriAttribute.new
    end
  end

  def nutri_attribute_params
    params.require(:nutri_attribute).permit(:name, :units, :active)
  end

end
