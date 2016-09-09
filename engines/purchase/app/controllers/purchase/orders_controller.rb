require_dependency 'purchase/application_controller'

module Purchase
  class OrdersController < ApplicationController
    before_action :set_order, only: [:edit, :show, :update, :destroy]

    has_scope :by_contract
    has_scope :by_period, :using => [:started_at, :ended_at] do |controller, scope, value|
        
      started = value[0].nil? ? Date.today.beginning_of_month : Date.parse(value[0])
      ended   = value[1].nil? ? Date.today.end_of_month : Date.parse(value[1])
      
      scope.by_period(started, ended)
    end

    has_scope :by_status
    has_scope :by_id

    @@params = {}

    def index

      if params[:by_period].nil?
        params[:by_period]               = {}
        params[:by_period]['started_at'] =  Date.today.beginning_of_month.strftime("%d/%m/%Y")
        params[:by_period]['ended_at']   =  Date.today.end_of_month.strftime("%d/%m/%Y")
      end

      @@params = params
      @orders  = apply_scopes(Purchase::Order).all
    end

    def show
    end
    
    def new
     @filter = @@params
     @order  = Purchase::Order.new
    end

    def fpa
      @order = Purchase::Order.find(params[:order_id])

      render layout: 'less'
    end

    def create
      @order  = Purchase::Order.new(set_params)
      
      if @order.save
        @filter = @@params
        flash[:success] =  t :success
        redirect_to orders_path(@filter)
      else
        @filter = @@params
        render action: :new
      end
    end

    def edit
      @filter = @@params
    end

    def update
      @filter = @@params

      if @order.update(set_params) 
        flash[:success] =  t :success
        redirect_to orders_path(@filter)
      else
        render action: :new
      end
    end

    def destroy
      if @order.destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end

      redirect_to orders_path(@@params)
    end

    private

    def set_params
      params.require(:order).permit(:description, :contract_id, :category_id, :buy_type, :status, :supplier_id, 
                                    :observation, :invoice_number, :delivery, :form_payment, 
                                    :seller, :requester, :deadline_payment, :carrier_id, :freight, 
                                    :inventory, :icms, :created_at, :order_type,
                                    order_items_attributes: [:id, :_destroy, :quantity, :product_title, :unit_value,
                                      :unit_id, :contract_value, :observation]
)
    end

    def set_order
      @order = Purchase::Order.find(params[:id])
    end
    
  end
end