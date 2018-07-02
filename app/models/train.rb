# frozen_string_literal: true

class Train < ApplicationRecord
  SORTING = { 'From Head to Tail' => true, 'From Tail to Head' => false }.freeze

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true

  has_many   :tickets
  has_many   :carriages

  validates  :number, presence: true

  def seats_count_by_type(carriage_type, seats_type)
    case carriage_type
    when :economy
      economy_seats_sum_hash[seats_type]
    when :coupe
      coupe_seats_sum_hash[seats_type]
    end
  end

  private

  def economy_seats_sum_hash
    economy = carriages.where(type: Carriage::TYPES[0])
    {
      top_seats: economy.sum('top_seats') + economy.sum('side_top_seats'),
      bottom_seats: economy.sum('bottom_seats') + economy.sum('side_bottom_seats')
    }
  end

  def coupe_seats_sum_hash
    coupe = carriages.where(type: Carriage::TYPES[1])
    {
      top_seats: coupe.sum('top_seats'),
      bottom_seats: coupe.sum('bottom_seats')
    }
  end
end
