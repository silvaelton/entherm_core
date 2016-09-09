module Core
  class Contract < ActiveRecord::Base
    belongs_to :company
    
    has_many :orders, class_name: "Purchase::Order"

    default_scope {order(:name)}    
    validates :name,  presence: true


    def self.collection_total_value_per_period(period = nil)
      array = []
      all.each_with_index do |contract, index|
        array[index] = {}
        array[index][:contract]    = contract.name
        array[index][:total_value] = contract.total_value_per_period(period)
      end

      array
    end

    def total_value_per_period(period = nil)
      if !period.nil?
        started_at = Date.parse(period['started_at']) rescue Date.today.beginning_of_month
        ended_at   = Date.parse(period['ended_at']) rescue Date.today.end_of_mont
        self.orders.joins(:order_items).where(created_at: started_at..ended_at).sum('purchase_order_items.total_value')
      else
        self.orders.joins(:order_items).sum('purchase_order_items.total_value')
      end
    end
  end
end
