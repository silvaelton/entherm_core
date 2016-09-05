require_dependency 'core/application_controller'

module Core
  class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
    
    def index
      @users = Core::User.all
    end

    def new
      @user = Core::User.new
    end

    def create
      @user = Core::User.new(set_params)

      if @user.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def edit
    end

    def update
      
      if params[:user][:password].blank? &&  params[:user][:password_confirmation].blank? 
        params[:user].delete :password
        params[:user].delete :password_confirmation
      end

      if @user.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end

    end

    def destroy
      if @user.destroy 
        flash[:success] =  t :success
      else 
        flash[:danger]  =  t :danger
      end

      redirect_to action: :index
    
    end

    private

    def set_params
      params.require(:user).permit(:name, :telephone, :email, :password, :password_confirmation,
                                   :status, :administrator)
    end

    def set_user
      @user = Core::User.find(params[:id])
    end

  end
end
