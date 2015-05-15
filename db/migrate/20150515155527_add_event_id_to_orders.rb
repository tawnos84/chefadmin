class AddEventIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :event_id, :string
  end
end
