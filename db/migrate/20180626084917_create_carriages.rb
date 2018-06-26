class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :kind
      t.integer :up_seats
      t.integer :down_seats
      t.integer :train_id

      t.timestamps
    end
  end
end
