class AddNameZipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    # add_column :users, :zip, :integer, :default => 0
    # add_column :users, :gmaps, :boolean
  end
end
