# frozen_string_literal: true

class EconomyCarriage < Carriage
  belongs_to :train
  validates :side_top_seats, :side_bottom_seats, presence: true
end
