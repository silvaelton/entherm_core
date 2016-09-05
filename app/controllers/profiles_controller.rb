class ProfilesController < ApplicationController 
  
  def edit
    @user = current_user
  end

  def update

    if params[:user][:password].blank? &&  params[:user][:password_confirmation].blank? 
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end
    
    @user = current_user
    if @user.update(set_params)
      flash[:success] =  t :success
      redirect_to action: :edit
    else
      render action: :edit
    end
  end

  private

  def set_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
