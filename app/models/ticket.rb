# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :route
  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station,   class_name: 'RailwayStation', foreign_key: :end_station_id

  def departure_time
    route.railway_station_route(begin_station).departure_time
  end

  def arrival_time
    route.railway_station_route(end_station).arrival_time
  end
end
