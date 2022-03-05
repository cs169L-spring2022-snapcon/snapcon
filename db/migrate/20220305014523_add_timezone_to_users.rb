class AddTimezoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :timezome, :string
  end
end
