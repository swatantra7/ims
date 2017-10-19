class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_filter :valid_request

  protected

  def after_sign_in_path_for(resource)
    admin_courses_path
  end

  def valid_request
    if restricted_action
      redirect_to new_user_session_path
    end
  end

  def restricted_action
    controller_name == 'registrations' && action_name == 'new'
  end

end


