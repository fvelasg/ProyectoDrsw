class MaterialsReserves < ActiveRecord::Migration
  def up
    create_table :materials_reserves, :id => false do |t|
      t.references :material
      t.references :reserve
    end

  end
  def change
    create_table :materials_reserves, :id => false do |t|
      t.references :material
      t.references :reserve
    end
    add_index materials_reserves, :material_id
    add_index materials_reserves, :reserve_id
  end 

  def down
  end
end
