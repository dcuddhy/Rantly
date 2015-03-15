class AuthenticationController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to rants_path
    else
      @sign_in_error = "Username / password combination is invalid"
      redirect_to rants_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
