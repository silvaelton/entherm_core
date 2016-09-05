require_dependency 'core/application_controller'

module Core
  class ContractsController < ApplicationController
    before_action :set_contract, only: [:edit, :update, :destroy]
    
    def index
      @contracts = Core::Contract.all
    end

    def new
      @contract = Core::Contract.new
    end

    def create
      @contract = Core::Contract.new(set_params)

      if @contract.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def edit
    end

    def update
    
      if @contract.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end

    end

    def destroy
      if @contract.destroy 
        flash[:success] =  t :success
      else 
        flash[:danger]  =  t :danger
      end

      redirect_to action: :index
    
    end

    private

    def set_params
      params.require(:contract).permit(:company_id, :name, :description, :code, :status)
    end

    def set_contract
      @contract = Core::Contract.find(params[:id])
    end

  end
end
