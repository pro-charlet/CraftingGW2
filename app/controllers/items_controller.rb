class ItemsController < ApplicationController
  respond_to :html,:js
  
  def index
    @items = Item.find(:all, :conditions => ['name ILIKE ?', "%#{params[:search]}%"])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update_attributes(params[:item])
    
    respond_with do |format|
      format.js {}
      format.html { redirect_to recipy_path(@item) }
    end
  end
  
  def create
    @item = Item.find_by_name(params[:item][:name])
    
    if @item.nil?
      @item = Item.new(params[:item])
      @item.name[0] = @item.name[0].to_s.capitalize 
      @item.save
    end
        
    redirect_to recipy_path(@item)
  end
end
