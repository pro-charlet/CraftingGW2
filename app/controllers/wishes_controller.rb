class WishesController < ApplicationController
  respond_to :html, :js
  
  def create
    @wishe = Wishe.new(params[:wishe])
    @wishe.save
    
    redirect_to member_path(@wishe.member)
  end
  
  def update
    @wishe = Wishe.find(params[:id])
    @wishe.statut = params[:statut] unless params[:statut].nil?
    @wishe.number = params[:wishe][:number] unless params[:wishe][:number].nil?
    @wishe.save
    
    respond_with do |format|
      format.js {}
      format.html { redirect_to root_path }
    end
  end
  
  def destroy
    @wishe = Wishe.find(params[:id])
    @wishe.delete
    
    redirect_to member_path(@wishe.member)
  end
end
