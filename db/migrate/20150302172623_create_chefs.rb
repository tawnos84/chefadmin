class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :age
      t.string :location
      t.text :styles

      t.timestamps null: false
    end
  end
end
