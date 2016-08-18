class AddRollToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :roll, :integer
    add_column :users, :name, :string
  end
end
