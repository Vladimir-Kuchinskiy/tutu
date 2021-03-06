# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.serial_number').uniq }

  def update_serial_number(route, serial_number)
    station_route = station_route(route)
    station_route&.update(serial_number: serial_number)
  end

  def serial_number(route)
    station_route(route).try(:serial_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
