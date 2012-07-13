class Craftman < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :member
  belongs_to :crafting

  attr_accessible :member_id, :crafting_id, :level, :craft_name

  def craft_name
    crafting.name if crafting
  end
  
  def craft_name=(name)
    self.crafting = Crafting.find_by_name(name) unless name.blank?
    self.crafting_id = self.crafting.id unless self.crafting.nil?
  end
end
