class RenameFromColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :from, :from_id
    
  end
end
