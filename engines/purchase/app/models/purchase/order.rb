module Purchase
  class Order < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    belongs_to :category, class_name: "Purchase::OrderCategory"
    belongs_to :supplier
    enum order_type: ['orçamento', 'compra']
  end
end
