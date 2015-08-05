class AddEMailStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :email_status, :string, default: 'NOT_SENT'
  end
end
