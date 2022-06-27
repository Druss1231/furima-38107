class RenameShipDateColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship, :ship_date_id
  end
end
