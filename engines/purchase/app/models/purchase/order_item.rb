module Purchase
  class OrderItem < ActiveRecord::Base
    belongs_to :product

    after_validation :set_total_value

    #enum unit_ids: ['un','kg','mt','cx','cm','lt']

    #validates :quantity, :product_title, :unit_value, :contract_value, presence: true
    
    def product_title
      product.try(:name)
    end

    def product_title=(title)
      self.product = Product.find_or_create_by(name: title.downcase) if title.present?
    end

    private

    def set_total_value
      if self.quantity.present? && self.unit_value.present? 
        self.total_value = self.quantity * self.unit_value
      else 
        0
      end
    end
  end
end
