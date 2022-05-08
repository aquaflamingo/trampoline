class ApplicationController < ActionController::Base
  def current_profile?
    current_profile.present?
  end

  def current_profile
    # TODO 
    if session[:profile_id]
      @current_profile = Profile.find(session[:profile_id])
      @current_profile
    else 
      # FIXME:
      Profile.first
    end
  end
end
