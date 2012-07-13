class Recipie < ActiveRecord::Base
  belongs_to :item
  belongs_to :ingredient, :class_name => 'Item'

  attr_accessible :item_id, :ingredient_id, :number, :item_name, :ingredient_name

  def item_name
    item.name if item
  end
  
  def item_name=(name)
    self.item = Item.find_by_name(name) unless name.blank?
    self.item_id = self.item.id unless self.item.nil?
  end

  def ingredient_name
    ingredient.name if ingredient
  end
  
  def ingredient_name=(name)
    self.ingredient = Item.find_by_name(name) unless name.blank?
    self.ingredient_id = self.ingredient.id unless self.ingredient.nil?
  end

end
