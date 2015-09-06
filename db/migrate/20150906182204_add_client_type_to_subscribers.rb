class AddClientTypeToSubscribers < ActiveRecord::Migration
  def change
        add_column :subscribers, :clienttype, :string
  end
end
