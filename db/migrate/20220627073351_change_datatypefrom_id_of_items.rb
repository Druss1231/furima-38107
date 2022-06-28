class ChangeDatatypefromIdOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :from_id, :integer
  end
end
