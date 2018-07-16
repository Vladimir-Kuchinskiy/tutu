class UpdateIndexInCarriages < ActiveRecord::Migration[5.2]
  def change
    remove_index :carriages, :train_id
    add_index    :carriages, :train_id, unique: true
  end
end
