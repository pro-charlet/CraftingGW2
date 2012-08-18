class Member < ActiveRecord::Base
  has_many :wishes, :class_name => 'Wishe' 
  has_many :craftmen 
  has_many :craftings, :through => :craftmen, :class_name => 'Crafting' 
  
  attr_accessible :phpbb_id, :name

  def crafting_level?(crafting_id, level)
    crafting(crafting_id).level >= level unless crafting(crafting_id).nil?
  end

  def crafting(crafting_id)
    array = self.craftmen.select{ |craftman| craftman.crafting_id == crafting_id}
    return array[0] unless array.empty?
  end
end
