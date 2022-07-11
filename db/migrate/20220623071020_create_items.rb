class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,       null: false
      t.text    :price,       null: false
      t.text    :fee,         null: false
      t.text    :description, null: false
      t.integer :category, null: false
      t.text    :condition_id, null: false
      t.text    :from_id,     null: false
      t.text    :shipdate_id, null: false

      t.timestamps
    end
  end
end
