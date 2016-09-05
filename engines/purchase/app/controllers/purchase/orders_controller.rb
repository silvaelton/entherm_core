require_dependency 'purchase/application_controller'

module Purchase
  class OrdersController < ApplicationController
    
    def index
    end

    def new
      @order = Purchase::Order.new
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