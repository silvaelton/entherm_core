require_dependency 'external/application_controller'

module External
  class ProfilesController < ApplicationController 
    
    def edit
      @requester = current_user
    end

    def update

      if params[:requester][:password].blank? &&  params[:requester][:password_confirmation].blank? 
        params[:requester].delete :password
        params[:requester].delete :password_confirmation
      end
      
      @requester = current_user
      if @requester.update(set_params)
        flash[:success] =  t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end

    private

    def set_params
      params.require(:requester).permit(:name, :email, :password, :password_confirmation)
    end
    
  end
end
