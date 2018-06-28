# frozen_string_literal: true

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
      redirect_to @carriage.becomes(Carriage), notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage.becomes(Carriage), notice: 'Carriage was successfully updated.'
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
    params.require(:carriage).permit(:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
                                     :train_id, :type)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id])
  end
end
