class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id].present?
  end
  helper_method :current_student
end
