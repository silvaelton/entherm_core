require_dependency 'purchase/application_controller'

module Purchase
  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:edit, :update, :destroy]

    has_scope :by_name

    def index
      @suppliers = apply_scopes(Purchase::Supplier).includes(:state).all
    end

    def new
      @supplier = Purchase::Supplier.new
    end

    def create
      @supplier = Purchase::Supplier.new(set_params)

      if @supplier.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @supplier.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def destroy
      if @supplier.destroy 
        flash[:success] = t :success
      else 
        flash[:danger] = t :danger
      end 

      redirect_to action: :index
    end
    
    private

    def set_params
      params.require(:supplier).permit(:name, :category_id, :contact_name, :contact_telephone, 
                                       :contact_telephone_optional, :contact_email, 
                                       :contact_celphone, :cep, :state_id, :city, :address,
                                       :complement, :observation)

    end

    def set_supplier
      @supplier = Purchase::Supplier.find(params[:id])
    end
  end
end