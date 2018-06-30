# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = %w[EconomyCarriage CoupeCarriage].freeze

  belongs_to :train

  validates :number, :top_seats, :bottom_seats, :type, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe,   -> { where(type: 'CoupeCarriage') }
  scope :ordered, ->(object) { object.sorting ? order(:number) : order(number: :desc) }

  private

  def add_number
    self.number = (train.carriages[-2].try(:number) || 0) + 1
  end
end
