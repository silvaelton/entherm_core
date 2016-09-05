module Purchase
  class ProductsController < ::ApplicationController
    before_action :validate_session!

    def index

      respond_to do |format|
        format.json {
          render json: Product.where("name like ?", "%#{params[:term]}%").order(:name).map(&:name) 
        }
        format.html {}
      end
    end

    private

    def validate_session!
      if !session[:requester_id].present? && !session[:user_id].present?
        redirect_to '/404'
      end
    end
  end
end