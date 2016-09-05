module Purchase
  class Request < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    has_many   :request_items
    
    enum priority: ['alta', 'normal', 'baixa']
    enum situation: ['pendente', 'processado', 'cancelado']

    accepts_nested_attributes_for :request_items, allow_destroy: true
  

    validates :contract, :priority, :description, presence: true
  end
end
