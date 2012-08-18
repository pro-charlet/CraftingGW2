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
    if params[:id] == "0"
      @member = Member.find_by_phpbb_id(cookies[:phpbb3_hjy2a_u])
    else  
      @member = Member.find(params[:id])
    end
  
    @craftings = Hash.new
    @member.craftmen.each { |craftman| @craftings[craftman.crafting_id] = Wishe.find_crafting(craftman.crafting_id)}
        
        
    respond_with @member
  end
  
  def start
    cookies[:phpbb3_hjy2a_u] = "66"
    if cookies[:phpbb3_hjy2a_u].nil? || cookies[:phpbb3_hjy2a_u].empty?
      redirect_to boards_path
    else
      @member = Member.find_by_phpbb_id(cookies[:phpbb3_hjy2a_u])
      
      if @member.nil?
        @member = Member.create(:name => params[:id].nil? ? "New member" : params[:id], :phpbb_id => cookies[:phpbb3_hjy2a_u])
      end
      
      @craftings = Hash.new
      @member.craftmen.each { |craftman| @craftings[craftman.crafting_id] = Wishe.find_crafting(craftman.crafting_id)}
        
        
      respond_with(@member) do |format|
        format.html { render 'show' }
      end
    end
  end
  
end
