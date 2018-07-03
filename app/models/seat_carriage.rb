# frozen_string_literal: true

class SeatCarriage < Carriage
  validates :seat_seats, presence: true
end
