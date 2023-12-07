class AddAddressToTrees < ActiveRecord::Migration[7.1]
  def change
    add_column :trees, :address, :string
  end
end
