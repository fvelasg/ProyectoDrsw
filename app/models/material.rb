class Material < ActiveRecord::Base
  belongs_to :category
  attr_accessible :cantidadfisica, :descripcion, :nombre, :preciounidad, :unidadmedida
  has_and_belongs_to_many :reserves
  

end
