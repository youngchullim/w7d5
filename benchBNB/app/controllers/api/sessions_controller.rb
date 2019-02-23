
class Api::SessionController < ApplicationController

  def create 
    
  end

  def destroy 
    if current_user
      logout!
      render :json {}
    else
      render :json 'Error', status: 404
    end
  end

end