class Material < ActiveRecord::Base
  belongs_to :category
  attr_accessible :cantidadfisica, :descripcion, :nombre, :preciounidad, :unidadmedida
end
