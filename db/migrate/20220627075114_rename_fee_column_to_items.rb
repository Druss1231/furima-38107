class RenameFeeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :fee, :fee_id
  end
end
