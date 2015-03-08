class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name


      t.references :chef, index: true

      t.timestamps null: false
    end
  end
end
