# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = %w[EconomyCarriage CoupeCarriage SvCarriage SeatCarriage].freeze

  belongs_to :train, dependent: :destroy

  validates :number, :type, presence: true
  # TODO unique index in db
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number, on: :create

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe,   -> { where(type: 'CoupeCarriage') }
  scope :seat,    -> { where(type: 'SeatCarriage') }
  scope :sv,      -> { where(type: 'SvCarriage') }
  scope :ordered, ->(object) { object.sorting ? order(:number) : order(number: :desc) }

  private

  # TODO only on create
  def add_number
    byebug
    self.number = (train.carriages.where.not(number: nil).last.number || 0) + 1
  end
end
