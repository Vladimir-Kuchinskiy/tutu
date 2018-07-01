# frozen_string_literal: true

class CoupeCarriage < Carriage
  belongs_to :train, optional: true
  def sad
    sad = 3
  end
end
