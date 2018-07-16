# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = %w[EconomyCarriage CoupeCarriage SvCarriage SeatCarriage].freeze

  belongs_to :train

  validates :number, :type, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number, on: :create

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe,   -> { where(type: 'CoupeCarriage') }
  scope :seat,    -> { where(type: 'SeatCarriage') }
  scope :sv,      -> { where(type: 'SvCarriage') }
  scope :ordered, ->(object) { object.sorting ? order(:number) : order(number: :desc) }

  private

  def add_number
    self.number = (train.carriages.where.not(number: nil).last.try(:number) || 0) + 1
  end
end
