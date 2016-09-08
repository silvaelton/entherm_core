require_dependency 'purchase/application_controller'

module Purchase
  class OrdersController < ApplicationController
    
    has_scope :by_contract
    has_scope :by_period, :using => [:started_at, :ended_at] do |controller, scope, value|
        
      started = value[0].nil? ? Date.today.beginning_of_month : Date.parse(value[0])
      ended   = value[1].nil? ? Date.today.end_of_month : Date.parse(value[1])
      
      scope.by_period(started, ended)
    end

    has_scope :by_status
    has_scope :by_id

    def index
      @orders = apply_scopes(Purchase::Order).all
    end

    def new
      @order = Purchase::Order.new
    end

    def fpa
      @order = Purchase::Order.find(params[:order_id])

      render layout: 'less'
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_params
    end

    def set_order
    end
    
  end
end