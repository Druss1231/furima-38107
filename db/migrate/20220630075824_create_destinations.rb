class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string     :post_code,   null: false
      t.integer    :prefecture,    null: false
      t.string     :city
      t.string     :address_line
      t.string     :building
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
