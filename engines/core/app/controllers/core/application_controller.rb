module Core
  class ApplicationController < ActionController::Base
    layout 'application'

    before_action :requester_session?

    def current_user
      Core::User.find(session[:user_id]) rescue nil
    end

    helper_method :current_user

    private

    def requester_session?
      if !session[:user_id].present?
        redirect_to main_app.new_session_path if controller_name != "sessions"
      end
    end
  end
end
