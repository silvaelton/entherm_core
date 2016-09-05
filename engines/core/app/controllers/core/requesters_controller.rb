require_dependency 'core/application_controller'

module Core
  class RequestersController < ApplicationController
    before_action :set_requester, only: [:edit, :update, :destroy]
    
    def index
      @requesters = Core::Requester.all
    end

    def new
      @requester = Core::Requester.new
    end

    def create
      @requester = Core::Requester.new(set_params)

      if @requester.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def edit
    end

    def update
      if params[:requester][:password].blank? &&  params[:requester][:password_confirmation].blank? 
        params[:requester].delete :password
        params[:requester].delete :password_confirmation
      end
      
      if @requester.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end

    end

    def destroy
      if @requester.destroy 
        flash[:success] =  t :success
      else 
        flash[:danger]  =  t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:requester).permit(:name, :email, :password, :password_confirmation, :avatar, :status, contracts_id: [])
    end

    def set_requester
      @requester = Core::Requester.find(params[:id])
    end

  end
end
