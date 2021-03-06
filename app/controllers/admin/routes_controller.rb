# frozen_string_literal: true

class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: %i[show edit update update_name destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show; end

  def edit; end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to [:admin, @route], notice: 'Route was successfully created.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_update
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_url, notice: 'Route was successfully destroyed.'
  end

  private

  def redirect_update
    if params[:route][:name_only]
      redirect_to admin_routes_url, notice: 'Route was successfully updated.'
    else
      redirect_to [:admin, @route], notice: 'Route was successfully updated.'
    end
  end

  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
