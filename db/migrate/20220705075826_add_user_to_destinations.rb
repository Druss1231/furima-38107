class AddUserToDestinations < ActiveRecord::Migration[6.0]
  def change
    add_reference :destinations, :order, foreign_key: true
  end
end
