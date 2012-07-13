class Crafting < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :items
  has_many :wishes, :through => :items, :class_name => 'Wishe'
end
