class Item < ActiveRecord::Base
  has_many :recipies, :class_name => 'Recipie' 
  has_many :wishes, :class_name => 'Wishe' 
  has_many :ingredients, :through => :recipies, :source => :ingredient, :class_name => 'Item'
  belongs_to :crafting 

  attr_accessible :priority_id, :name, :url, :crafting_id, :niveau, :gathering, :looting, :salvaging, :purchasing

  def url_missing?
    return self.url.nil? || self.url.empty?
  end
  
  def craftable?
    return !self.material?
  end
  
  def material?
    return self.gathering || self.looting || self.salvaging || self.purchasing
  end    
end
