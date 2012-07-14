class Wishe < ActiveRecord::Base
  belongs_to :member
  belongs_to :item

  attr_accessible :member_id, :item_id, :statut, :item_name

  def item_name
    item.name if item
  end
  
  def item_name=(name)
    self.item = Item.find_by_name(name) unless name.blank?
    self.item_id = self.item.id unless self.item.nil?
  end

  def self.find_crafting(crafting_id)
    self.find_by_sql(["SELECT w.id, i.id AS item_id, i.name, i.url, i.niveau FROM Wishes w, Items i WHERE w.item_id = i.id AND i.crafting_id = ? AND (Statut = ? OR Statut = ?)", crafting_id, "Recherche", "Disponible"])
  end

end
