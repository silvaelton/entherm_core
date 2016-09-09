module Purchase
  class Request < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    belongs_to :requester, primary_key: 'id', foreign_key: 'requester_id', class_name: "Core::Requester"
    has_many   :request_items
    has_many   :request_comments
    
    default_scope { order('created_at DESC') }
    scope :by_contract, -> (value) { where(contract_id: value)}
    scope :by_period,   -> started_at, ended_at { where(created_at: started_at..ended_at) }
    scope :by_status,   -> status { where(situation: status) }
    scope :by_id,       -> id     { where(id: id) }
    
    scope :open,        -> { where(situation: 0) }
    scope :processing,  -> { where(situation: 1) }
    scope :finish,      -> { where(situation: 2) }
    scope :canceled,    -> { where(situation: 3) }
        

    enum priority: ['alta', 'normal', 'baixa']
    enum situation: ['pendente', 'processando', 'finalizado', 'cancelado']

    accepts_nested_attributes_for :request_items, allow_destroy: true
  

    #validates :contract, :priority, :description, presence: true
  end
end
