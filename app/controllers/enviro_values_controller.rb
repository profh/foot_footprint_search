class EnviroValuesController < ApplicationController
before_action :set_enviro_value, only: [:show, :edit, :update, :destroy]

  def index
    @enviro_values = EnviroValue.all
    if @enviro_values.empty?
      @enviro_values = [NullEnviroValue.new]
    end
  end

  def new
  end

  def show
  end

  def create
    @enviro_value = EnviroValue.new(enviro_value_params)
    if @enviro_value.save
      redirect_to enviro_values_path #, notice: "Flash message?"
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @enviro_value.update(enviro_value_params)
      redirect_to enviro_values_path # , notice: "Optional flash message"
    else
      render action: 'edit'
    end
  end

  def destroy
    @enviro_value.destroy
    redirect_to enviro_values_path #, notice: "Flash message?"
  end

  private

  def set_enviro_value
    @enviro_value = EnviroValue.find(params[:id])
    if @enviro_value.nil?
      @enviro_value = NullEnviroValue.new
    end
  end

  def enviro_value_params
    params.require(:enviro_value).permit(:food_id, :enviro_type_id, :value)
  end

end
