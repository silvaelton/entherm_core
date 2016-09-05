module Purchase
  class RequestItem < ActiveRecord::Base
    belongs_to :product 
    belongs_to :unit

    validates :quantity, :product_title, :goal, presence: true 
    validates :quantity, numericality: true

    def product_title
      product.try(:name)
    end

    def product_title=(title)
      self.product = Product.find_or_create_by(name: title.downcase) if title.present?
    end
  end
end
