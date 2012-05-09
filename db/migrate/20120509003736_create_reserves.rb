class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.integer :estado
      t.references :user

      t.timestamps
    end
    add_index :reserves, :user_id
  end
end
