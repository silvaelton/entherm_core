require_dependency 'external/application_controller'

module External
  class SessionsController < ApplicationController 
    
    def new
      @session = External::Session.new
    end

    def create
      @session = External::Session.new(set_params)

      if @session.valid?
        session[:requester_id] = @session.id
        redirect_to external.root_path
      else
        render action: :new
      end
    end

    def logout
      session[:requester_id] = nil
      redirect_to external.new_session_path
    end

    private

    def set_params
      params.require(:session).permit(:email, :password)
    end
    
  end
end
