class AddCoordinatesToTrees < ActiveRecord::Migration[7.1]
  def change
    add_column :trees, :latitude, :float
    add_column :trees, :longitude, :float
  end
end
