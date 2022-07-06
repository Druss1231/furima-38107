class ChangeColumnsAddNotnullOnDestinations < ActiveRecord::Migration[6.0]
  def change
    change_column_null :destinations, :city, false
    change_column_null :destinations, :address_line, false
  end
end
