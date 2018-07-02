class SearchesController < ApplicationController
  before_action :authenticate_user!, only: :search
  def show
    @stations = RailwayStation.all
  end

  def search
    @departure_station = RailwayStation.find(params[:departure_station_id])
    @arrival_station = RailwayStation.find(params[:arrival_station_id])
    @routes = Route.search_routes(@departure_station, @arrival_station)
  end
end
