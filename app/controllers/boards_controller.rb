class BoardsController < ApplicationController
  before_filter :set_user
  
  def index
    @wishes = Wishe.find(:all, :conditions => ["statut = ? OR statut = ? OR updated_at > ?", "Recherche", "Disponible", Date.current])
    
    @items = @wishes.collect{ |wish| {:item => wish.item, :sum => wish[:number]} }
    @ingredient = Hash.new
    @items.collect{ |item| 
      if item[:item].recipies.empty?
        item[:sum] += @ingredient[item[:item].id][:sum] if @ingredient.has_key?(item[:item].id)
        @ingredient[item[:item].id] = {:item => item[:item], :sum => item[:sum]}
      else
        item[:item].recipies.collect { |recipie| @items << {:item => recipie.ingredient, :sum => item[:sum]*recipie.number} }    
      end  
    }
    
    @craftmen = Hash.new 
    Crafting.all.collect { |c| @craftmen[c.id] = {:name => c.name, :icone => c.icone, :members => []}}
    Craftman.find(:all, :conditions => ["level > 0"], :order => 'level DESC').collect { |craftman| @craftmen[craftman.crafting_id][:members] << {:name => craftman.member.name, :level => craftman.level} }
    
  end
end
