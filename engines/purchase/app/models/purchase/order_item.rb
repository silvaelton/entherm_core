module Purchase
  class OrderItem < ActiveRecord::Base
    belongs_to :product
  end
end
