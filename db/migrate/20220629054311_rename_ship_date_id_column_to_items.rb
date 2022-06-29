class RenameShipDateIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :ship_date_id, :shipdate_id
  end
end
