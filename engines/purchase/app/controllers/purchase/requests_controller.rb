require_dependency 'purchase/application_controller'

module Purchase
  class RequestsController < ApplicationController
    
    def index
      @requests = Purchase::Request.all.order("created_at DESC")
    end

    def show
    end

    def update
    end
    
  end
end