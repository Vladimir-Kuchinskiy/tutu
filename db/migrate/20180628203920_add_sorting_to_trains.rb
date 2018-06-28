# frozen_string_literal: true

class AddSortingToTrains < ActiveRecord::Migration[5.2]
  def change
    add_column :trains, :sorting, :boolean
  end
end
