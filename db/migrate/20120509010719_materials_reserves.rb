class MaterialsReserves < ActiveRecord::Migration
  def up
    create_table :materials_reserves, :id => false do |t|
      t.references :material
      t.references :reserve
    end
    
    
  end
  
  def down
    drop_table :materials_reserves
  end
end
