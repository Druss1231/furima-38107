class RemoveUserIdFromorder < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :user_id_id
  end
end
