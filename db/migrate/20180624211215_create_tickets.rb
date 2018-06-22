class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :begin_station_id
      t.integer :end_station_id
      t.integer :train_id
      t.string  :seat_number
      t.timestamps
    end
  end
end
