class CraftingController < ApplicationController
  respond_to :html,:js
  
  def show
    @crafting = Crafting.find(params[:id])

    respond_with do |format|
      format.html { render 'items/list' }
    end
  end
end

