# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = { economy: 'EconomyCarriage', coupe: 'CoupeCarriage', sv: 'SvCarriage', seat: 'SeatCarriage' }.freeze

  belongs_to :train

  validates :number, :type, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :add_number, on: :create

  scope :economy, -> { where(type: TYPES[:economy]) }
  scope :coupe,   -> { where(type: TYPES[:coupe]) }
  scope :seat,    -> { where(type: TYPES[:seat]) }
  scope :sv,      -> { where(type: TYPES[:sv]) }
  scope :ordered, ->(object) { object.sorting ? order(:number) : order(number: :desc) }

  def self.seats_count(type, seat)
    send(type).map(&:"#{seat}").inject(:+)
  end

  private

  def add_number
    self.number = (train.carriages.where.not(number: nil).last.try(:number) || 0) + 1
  end
end
