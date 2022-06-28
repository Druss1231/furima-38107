class ChangeDatatypefeeIdOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :fee_id, :integer
  end
end
