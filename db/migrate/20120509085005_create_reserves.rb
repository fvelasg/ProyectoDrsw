class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.integer :estado
      t.integer :cantidad
      t.references :user

      t.timestamps
    end
    add_index :reserves, :user_id
  end
  def down
    drop_table :reserves
  end
end
