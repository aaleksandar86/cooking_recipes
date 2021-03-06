class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "Welcome #{user.username} !"
      redirect_to user
    else
      flash.now[:danger] = 'Email and password miss match'
      render :new
    end

  end

  def destroy
    log_out
    redirect_to root_path
  end
end
