class AddIndexToTrains < ActiveRecord::Migration[5.2]
  def change
    remove_index :trains, :current_station_id
    add_index :trains, :current_station_id
  end
end
