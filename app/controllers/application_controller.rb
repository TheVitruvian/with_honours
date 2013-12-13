class ApplicationController < ActionController::Base
  protect_from_forgery  

  def current_ability 
    if current_user
      @current_ability = UserAbility.new(current_user)
    else
      @current_ability = CompanyAbility.new(current_company)
    end
  end

  def authenticate_user_or_company
    unless current_agent
      authenticate_user!
    end
  end

  def current_agent
    current_user || current_company
  end
end
