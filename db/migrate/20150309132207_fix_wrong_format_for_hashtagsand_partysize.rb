class FixWrongFormatForHashtagsandPartysize < ActiveRecord::Migration
  def change
    rename_column :menus, :hashtags, :hashtags_boolean
    add_column :menus, :hashtags, :string

    rename_column :menus, :partysize, :partysize_boolean
    add_column :menus, :partysize, :string
  end
end
