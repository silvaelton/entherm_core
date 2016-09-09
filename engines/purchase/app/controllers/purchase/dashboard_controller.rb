require_dependency 'purchase/application_controller'

module Purchase
  class DashboardController < ApplicationController
    
    def index
      @contracts = Core::Contract.collection_total_value_per_period(params[:by_period])
      @last_purchases = Purchase::Order.all.order('created_at DESC').limit(5)
      @last_requests  = Purchase::Request.all.order('created_at DESC').limit(5)
    end
    
  end
end