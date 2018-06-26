class Carriage < ApplicationRecord
  belongs_to :train
  enum kind: %i[compartment reserved_seat]
  validates :kind, :up_seats, :down_seats, presence: true
end
