# frozen_string_literal: true

class AddSeatSeatsToCarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :seat_seats, :integer
  end
end
