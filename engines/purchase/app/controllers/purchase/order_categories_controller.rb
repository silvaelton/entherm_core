require_dependency 'purchase/application_controller'

module Purchase
  class OrderCategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :destroy, :update]

    def index
      @categories = Purchase::OrderCategory.all
    end

    def new
      @category  = Purchase::OrderCategory.new
    end

    def create
      @category  = Purchase::OrderCategory.new(set_params)

      if @category.save
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def show
    end

    def update

      if @category.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @category.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:order_category).permit(:name, :status)
    end

    def set_category
      @category = Purchase::Category.find(params[:id])
    end
    
  end
end