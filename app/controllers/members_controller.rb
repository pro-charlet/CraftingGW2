class MembersController < ApplicationController
  respond_to :html,:js 

  def index
    @members = Member.find(:all, :conditions => ['name ILIKE ?', "%#{params[:search]}%"])
  end

  def create
    
    unless params[:member][:name].empty?
      @member = Member.find_by_name(params[:member][:name])
    
      redirect_to(@member.nil? ? boards_path : member_path(@member))
    else
      redirect_to boards_path
    end
  end
  
  def show
    @member = Member.find(params[:id])
  
    @craftings = Hash.new
    @member.craftmen.each { |craftman| @craftings[craftman.crafting_id] = Wishe.find_crafting(craftman.crafting_id)}
        
        
    respond_with @member
  end
  
  def start
    if params[:id].nil?
      redirect_to boards_path
    else
      @member = Member.find_or_create_by_name(params[:id])
  
      @craftings = Hash.new
      @member.craftmen.each { |craftman| @craftings[craftman.crafting_id] = Wishe.find_crafting(craftman.crafting_id)}
        
        
      respond_with(@member) do |format|
        format.html { render 'show' }
      end
    end
  end
  
end
