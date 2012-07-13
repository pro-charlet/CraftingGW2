class MembersController < ApplicationController
  respond_to :html,:js 

  def index
    @members = Member.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end

  def create
    @member = Member.find_or_create_by_name(params[:member][:name])
    
    redirect_to member_path(@member)
  end
  
  def show
    @member = Member.find(params[:id])
    
    @craftings = Hash.new
    @member.craftmen.each { |craftman| @craftings[craftman.crafting_id] = Wishe.find_crafting(craftman.crafting_id)}
    
    
    respond_with @member
  end
end
