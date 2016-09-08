module Purchase
  class Request < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    has_many   :request_items
  
    scope :open,        -> { where(situation: 0) }
    scope :processing,  -> { where(situation: 1) }
    scope :finish,      -> { where(situation: 2) }
    scope :canceled,    -> { where(situation: 3) }
        

 #   enum priority: ['alta', 'normal', 'baixa']
#    enum situation: ['pendente', 'processando', 'finalizado', 'cancelado']

    accepts_nested_attributes_for :request_items, allow_destroy: true
  

    #validates :contract, :priority, :description, presence: true
  end
end
