# frozen_string_literal: true

class CoupeCarriage < Carriage
  belongs_to :train
  validates :side_top_seats, :side_bottom_seats, presence: true
  validates :side_top_seats, :side_bottom_seats, numericality: { greater_than_or_equal_to: 1 }
end
