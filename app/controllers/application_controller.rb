class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_user
    @user = cookies[:phpbb3_hjy2a_u]
  end
end
