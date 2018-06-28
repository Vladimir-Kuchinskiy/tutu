# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }
  validates :serial_number, uniqueness: { scope: :route_id }, if: ->(object) { object.serial_number.present? }

  scope :ordered, -> { order(:serial_number) }
end
