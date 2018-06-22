# frozen_string_literal: true

class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

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
      redirect_to @route, notice: 'Route was successfully created.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Route was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html do
        redirect_to routes_url, notice: 'Route was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def route_params
    params.require(:route).permit(:name)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
