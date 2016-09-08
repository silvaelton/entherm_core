require_dependency 'external/application_controller'

module External
  class RequestsController < ApplicationController 
    
    def index
      @requests = Purchase::Request.where("contract_id = ? OR requester_id = ?", current_user.contract_ids.map(&:id), current_user.id)
    end

    def new
      @request  = Purchase::Request.new
    end

    def create
      @request  = Purchase::Request.new(set_params)
      @request.requester_id = current_user.id
      if @request.save
        flash[:success] =  t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end


    def destroy
      @request  = Purchase::Request.where(requester_id: current_user.id, id: params[:id]).first
      @request.destroy

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:request).permit(:contract_id, :requester_id, :description, :observation,  :priority, :archive,
                                      request_items_attributes: [:id, :product_title,:_destroy, :unit_id, :product_id, :quantity,:goal, :observation])
    end

  end
end
