class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[show edit update destroy]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def show; end

  def edit; end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to @carriage, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Carriage was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url, notice: 'Carriage was successfully destroyed.'
  end

  private

  def carriage_params
    params.require(:carriage).permit(:up_seats, :down_seats, :train_id, :kind)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end
end
