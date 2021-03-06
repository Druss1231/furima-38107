class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string     :post_code,   null: false
      t.integer    :from_id,    null: false
      t.string     :city
      t.string     :address_line
      t.string     :building
      t.string     :phone
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
