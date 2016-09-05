class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(set_params)

    if @session.valid?
      session[:user_id] = @session.id
      redirect_to main_app.root_path
    else
      render action: :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to main_app.new_session_path
  end

  private

  def set_params
    params.require(:session).permit(:email, :password)
  end
end