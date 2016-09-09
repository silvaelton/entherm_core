require_dependency 'purchase/application_controller'

module Purchase
  class RequestsController < ApplicationController
    before_action :set_request_id, only: [:cancel, :processing, :finish]

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

      @@params = params 

      if params[:by_period].nil?
        params[:by_period]               = {}
        params[:by_period]['started_at'] =  Date.today.beginning_of_month.strftime("%d/%m/%Y")
        params[:by_period]['ended_at']   =  Date.today.end_of_month.strftime("%d/%m/%Y")
      end

      @requests = apply_scopes(Purchase::Request).all
    end

    def cancel
      @request.situation = 'cancelado'
      @request.save
      
      redirect_to requests_path(@@params)
    end

    def processing
      @request.situation = 'processando'
      @request.save
      
      redirect_to requests_path(@@params)
    end

    def finish

      @request.situation = 'finalizado'
      @request.save
      
      redirect_to requests_path(@@params)

    end

    def show
      @filter = @@params
      @request = Purchase::Request.find(params[:id])
    end

    def update
    end
    
    private

    def set_request_id
      @request = Purchase::Request.find(params[:request_id])
    end
  end
end