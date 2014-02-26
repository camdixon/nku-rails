class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_authentication

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id].present?
  end
  helper_method :current_student

  def require_authentication
    if current_student
      true
    else
      redirect_to new_session_path
    end
  end
end
