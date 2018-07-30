# frozen_string_literal: true

class Train < ApplicationRecord
  SORTING = { 'From Head to Tail': true, 'From Tail to Head': false }.freeze

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true

  has_many   :tickets
  has_many   :carriages, dependent: :destroy

  validates  :number, presence: true
end
