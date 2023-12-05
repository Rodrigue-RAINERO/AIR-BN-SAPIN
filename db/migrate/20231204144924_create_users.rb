class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :mail_address
      t.integer :telephone

      t.timestamps
    end
  end
end
