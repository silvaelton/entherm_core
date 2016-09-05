module External
  class ApplicationController < ActionController::Base
    layout 'external'

    before_action :requester_session?

    def current_user
      Core::Requester.find(session[:requester_id]) rescue nil
    end

    helper_method :current_user

    private

    def requester_session?
      if !session[:requester_id].present?
        redirect_to external.new_session_path if controller_name != "sessions"
      end
    end
  end
end
