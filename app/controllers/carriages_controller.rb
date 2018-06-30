# frozen_string_literal: true

class CarriagesController < ApplicationController
  before_action :set_train, only: %i[new create]

  def new
    @carriage = Carriage.new
  end

  def show
    @carriage = Carriage.find(params[:id])
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to @train, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
                                     :train_id, :type)
  end
end
