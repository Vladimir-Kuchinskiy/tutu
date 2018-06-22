class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :begin_station, class_name: 'RailwayStation', foreign_key: :begin_station_id
  belongs_to :end_station,   class_name: 'RailwayStation', foreign_key: :end_station_id
  validates  :seat_number,   presence: true
end
