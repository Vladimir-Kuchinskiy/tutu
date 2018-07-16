# frozen_string_literal: true

class UpdateIndexInCarriages < ActiveRecord::Migration[5.2]
  def change
    add_index :carriages, %i[train_id number], unique: true
  end
end
