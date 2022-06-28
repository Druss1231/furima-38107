class ChangeDatatypeshipIdOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :ship_date_id, :integer
  end
end
