# frozen_string_literal: true

class Route < ApplicationRecord
  validates :name, presence: true
end
