# frozen_string_literal: true

class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: %i[show edit update update_number destroy]

  def index
    @trains = Train.all
  end

  def show; end

  def new
    @train = Train.new
  end

  def edit; end

  def create
    @train = Train.new(train_params)
    respond_to do |format|
      if @train.save
        format.html { redirect_to [:admin, @train], notice: 'Train was successfully created.' }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO remove comments refactor redirect
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html do
          params[:train][:number_only] ? (redirect_to admin_trains_url, notice: 'Train was successfully updated.') :
              (redirect_to [:admin, @train], notice: 'Train was successfully updated.')
        end
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html do
        redirect_to admin_trains_url, notice: 'Train was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :sorting, :current_station_id, :route_id)
  end
end
