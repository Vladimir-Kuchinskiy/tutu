# frozen_string_literal: true

class AddRouteIdToTrains < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :trains, :route
  end
end
