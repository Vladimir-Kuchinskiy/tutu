# frozen_string_literal: true

class AddClientNameToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :client_name, :string
  end
end
