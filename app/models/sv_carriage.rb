# frozen_string_literal: true

class SvCarriage < Carriage
  validates :bottom_seats, presence: true
end
