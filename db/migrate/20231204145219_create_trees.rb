class CreateTrees < ActiveRecord::Migration[7.1]
  def change
    create_table :trees do |t|
      t.string :titre
      t.integer :taille
      t.integer :price
      t.text :geoloc
      t.text :description
      t.text :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
