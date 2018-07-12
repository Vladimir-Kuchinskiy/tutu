# frozen_string_literal: true

class CoupeCarriage < Carriage
  belongs_to :train
  validates :top_seats, :bottom_seats, presence: true
  validates :top_seats, :bottom_seats, numericality: { greater_than_or_equal_to: 1 }
end
