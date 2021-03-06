# frozen_string_literal: true

class AddArrivalTimeAndDepartureTimeToRailwayStationsRoutes < ActiveRecord::Migration[5.2]
  def change
    add_column :railway_stations_routes, :arrival_time, :datetime
    add_column :railway_stations_routes, :departure_time, :datetime
  end
end
