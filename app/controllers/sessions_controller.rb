class SessionsController < ApplicationController
  def oauth
    unless @user = User.find_by(uid: request.env['omniauth.auth']['uid'])
      @user = User.new
      @user.first_name = request.env['omniauth.auth']['info']['first_name']
      @user.last_name = request.env['omniauth.auth']['info']['last_name']
      @user.email = request.env['omniauth.auth']['info']['email']
      @user.auth_hash = request.env['omniauth.auth']
      @user.uid = request.env['omniauth.auth']['uid']
      @user.save!
    end
    session[:uid] = @user.id
    @alumni = Alumni.find_by(user_id: @user.id)
    @employer = Employer.find_by(user_id: @user.id)
    if @alumni
      redirect_to alumni_path(@alumni.id)
    elsif @employer
      redirect_to employer_path(@employer.id)
    else
      redirect_to '/account_type'
    end
  end

  def account_type
    @alumniperson = Alumni.find_by(user_id: current_user.id)
    @employerperson = Employer.find_by(user_id: current_user.id)
    if @alumniperson || @employerperson
      redirect_to '/'
    end
  end

  def logout
    session[:uid] = nil
    redirect_to '/'
  end
end
