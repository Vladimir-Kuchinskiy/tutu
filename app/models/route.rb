# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  has_many :tickets

  validates :name, presence: true
  validate  :stations_count

  before_validation :set_name, on: :create

  def self.search_routes(station1, station2)
    Route.all.select { |r| r.railway_stations.include?(station1) && r.railway_stations.include?(station2) }
  end

  def railway_station_route(station)
    railway_stations_routes.find_by(railway_station: station)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}" if railway_stations.size > 1
  end

  def stations_count
    errors.add(:base, 'Путь должен содержать как минимум 2 станции') if railway_stations.size < 2
  end
end
