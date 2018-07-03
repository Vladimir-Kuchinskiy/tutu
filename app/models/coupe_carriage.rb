# frozen_string_literal: true

class CoupeCarriage < Carriage
  belongs_to :train
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, presence: true
end
