class AddTypeToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :type, :string
  end
end
