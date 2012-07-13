class CraftmenController < ApplicationController
  respond_to :html, :js

  def update
    @craft = Craftman.find(params[:id])
    @craft.update_attributes(params[:craftman])
    
    redirect_to member_path(@craft.member)
  end

  def create
    @craft = Craftman.new(params[:craftman])
    if Craftman.find(:all, :conditions => {:member_id => @craft.member_id, :crafting_id => @craft.crafting_id}).empty?
      @craft.save
    end
    
    redirect_to member_path(@craft.member)
  end
  
  def destroy
    @craft = Craftman.find(params[:id])
    @craft.delete
    
    redirect_to member_path(@craft.member)
  end
end
