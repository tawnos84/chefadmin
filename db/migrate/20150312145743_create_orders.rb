class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :no_of_guests
      t.string :menu_id
      t.integer    :no_of_guests
      t.string     :name
      t.string     :email
      t.string     :phone
      t.string     :street
      t.string     :city
      t.string     :postalcode
      t.string     :country
      t.text     :remarks_sibaritas
      t.text     :remarks_chef
      t.float    :net_price
      t.float    :vat_amount

      t.timestamps null: false
    end
  end
end
