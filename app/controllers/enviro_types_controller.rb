class EnviroTypesController < ApplicationController
  before_action :set_enviro_type, only: [:show, :edit, :update, :destroy]

  def index
    @enviro_types = EnviroType.all
    if @enviro_types.empty?
      @enviro_types = [NullEnviroType.new]
    end
  end

  def new
  end

  def show
  end

  def create
    @enviro_type = EnviroType.new(enviro_type_params)
    if @enviro_type.save
      redirect_to @enviro_type #, notice: "Successfully created #{@enviro_type.name} in #{@enviro_type.units}" 
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @enviro_type.update(enviro_type_params)
      redirect_to enviro_type_path(@enviro_type)
    else
      render action: 'edit'
    end
  end

  def destroy
    @enviro_type.destroy
    redirect_to enviro_types_path
  end

  private 

  def set_enviro_type
    @enviro_type = EnviroType.find(params[:id])
    if @enviro_type.nil?
      @enviro_type = NullEnviroType.new
    end
  end

  def enviro_type_params
    params.require(:enviro_type).permit(:name, :units, :active)
  end
end
