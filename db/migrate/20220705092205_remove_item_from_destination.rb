class RemoveItemFromDestination < ActiveRecord::Migration[6.0]
  def change
    remove_column :destinations, :item_id, :reference
  end
end
