class Category < ActiveRecord::Base
  attr_accessible :descripcion, :nombre
  has_many :materials
end
