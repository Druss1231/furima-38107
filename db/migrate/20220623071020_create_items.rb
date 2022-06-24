class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :price
      t.text :fee
      t.text :description
      t.text :category
      t.text :condition
      t.text :from
      t.text :ship_date

      t.timestamps
    end
  end
end
