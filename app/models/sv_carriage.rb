# frozen_string_literal: true

class SvCarriage < Carriage
  validates :bottom_seats, presence: true
  validates :bottom_seats, numericality: { greater_than_or_equal_to: 1 }
end
