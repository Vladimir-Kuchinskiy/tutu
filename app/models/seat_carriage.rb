# frozen_string_literal: true

class SeatCarriage < Carriage
  validates :seat_seats, presence: true
  validates :seat_seats, numericality: { greater_than_or_equal_to: 1 }
end
