class SessionsController < ApplicationController
  def oauth
    unless @user = User.find_by(uid: request.env["omniauth.auth"]['uid'])
      @user = User.new
      @user.first_name = request.env["omniauth.auth"]['info']['first_name']
      @user.last_name = request.env["omniauth.auth"]['info']['last_name']
      @user.email = request.env["omniauth.auth"]['info']['email']
      @user.auth_hash = request.env["omniauth.auth"]
      @user.uid = request.env["omniauth.auth"]['uid']
      @user.save!
    end
    session[:uid] = @user.id
    redirect_to '/'
  end

  def logout
    session[:uid] = nil
    redirect_to '/'
  end
end
