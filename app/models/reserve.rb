class Reserve < ActiveRecord::Base
  belongs_to :user
  attr_accessible :estado
  has_and_belongs_to_many :materials
  

end
