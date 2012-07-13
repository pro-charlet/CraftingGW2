class WishesController < ApplicationController

  def create
    @wishe = Wishe.new(params[:wishe])
    @wishe.save
    
    redirect_to member_path(@wishe.member)
  end
end
