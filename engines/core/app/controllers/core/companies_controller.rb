require_dependency 'core/application_controller'

module Core
  class CompaniesController < ApplicationController
    before_action :set_company, only: [:edit, :update, :destroy]
    
    def index
      @companies = Core::Company.all
    end

    def new
      @company = Core::Company.new
    end

    def create
      @company = Core::Company.new(set_params)

      if @company.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end

    end

    def edit
    end

    def update
    
      if @company.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end

    end

    def destroy
      if @company.destroy 
        flash[:success] =  t :success
      else 
        flash[:danger]  =  t :danger
      end

      redirect_to action: :index
    
    end

    private

    def set_params
      params.require(:company).permit(:cnpj, :name, :address, 
        :city, :state_id, :status)
    end

    def set_company
      @company = Core::Company.find(params[:id])
    end

  end
end
