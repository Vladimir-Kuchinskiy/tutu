class AddRouteIdToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :route_id, :integer
  end
end
