# frozen_string_literal: true

class EconomyCarriage < Carriage
  belongs_to :train
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
            numericality: { greater_than_or_equal_to: 1 }
end
