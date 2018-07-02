# frozen_string_literal: true

class CoupeCarriage < Carriage
  belongs_to :train, optional: true
end
