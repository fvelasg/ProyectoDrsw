class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :cantidadfisica
      t.string :nombre
      t.string :descripcion
      t.string :unidadmedida
      t.integer :preciounidad
      t.references :category

      t.timestamps
    end
    add_index :materials, :category_id
  end
  def down
    drop_table :materials
  end
end
