class Carriage < ApplicationRecord

  TYPES = %w[EconomyCarriage CoupeCarriage].freeze

  belongs_to :train

  validates :number, :top_seats, :bottom_seats, :type, presence: true

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe,   -> { where(type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }
end
