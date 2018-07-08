# frozen_string_literal: true

class AddIndexesInAllForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_index :tickets, :train_id
    add_index :tickets, :route_id
    add_index :tickets, :user_id
  end
end
