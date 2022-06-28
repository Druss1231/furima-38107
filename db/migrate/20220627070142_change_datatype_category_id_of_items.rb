class ChangeDatatypeCategoryIdOfItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :category_id, :integer
  end
end
