class RecipiesController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @recipies = Recipie.find(:all, :conditions => {:item_id => @item.id })
    @composants = Recipie.find(:all, :conditions => {:ingredient_id => @item.id })
  end

  def create
    @recipie = Recipie.new(params[:recipie])
    @recipie.save
    
    redirect_to recipy_path(@recipie.item)
  end
  
  def destroy
    @recipie = Recipie.find(params[:id])
    @item = @recipie.item
    @recipie.delete
    
    redirect_to recipy_path(@item)
    
  end
end
