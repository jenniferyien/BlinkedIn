class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user = session[:uid]
    if session[:uid]
      @current_user ||= User.find(session[:uid])
    end
  end
  helper_method :current_user

  def avatar
    if Alumni.find_by(user: current_user)
      avatar = Alumni.find_by(user: current_user)
    end

    if Employer.find_by(user: current_user)
      avatar = Employer.find_by(user: current_user)
    end
  end
  helper_method :avatar
end
