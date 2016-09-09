module Purchase
  class Order < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    belongs_to :category, class_name: "Purchase::OrderCategory"
    belongs_to :supplier, -> { order(:name)}
    belongs_to :carrier, -> { order(:name) }, class_name: "Purchase::Supplier"
    
    has_many :order_items
      
    default_scope { order('created_at DESC') }
    scope :by_contract, -> (value) { where(contract_id: value)}
    scope :by_period,   -> started_at, ended_at { where(created_at: started_at..ended_at) }
    scope :by_status,   -> status { where(status: status) }
    scope :by_id,       -> id     { where(id: id) }
=begin  
=end

    
    validates :description, :order_type, :contract, :supplier, :status, presence: true
    validates :buy_type, :seller, :requester, :deadline_payment, presence: true
    validates_date :created_at, presence: true
    
    accepts_nested_attributes_for :order_items, allow_destroy: true
  

    enum order_type: ['orçamento','compra']
    enum status: ['aguardando','efetuada','cancelada']
    enum freight: ['cif', 'fob']
    enum form_payment: ['dinheiro', 'boleto', 'cheque', 'cartão', 'depósito']
    enum delivery: ['imediato','7_dias', '30_dias', '60_dias','90_dias','120_dias']
    enum buy_type: ['compras', 'serviços', 'locações', 'estoque']
    enum unit_id: ['un','kg','mt','cx','cm','lt']
   
    def self.total_value(array)
      total = 0
      array.each do |value|
        total += value.order_items.sum(:total_value)
      end

      total
    end


    def total_value
        self.order_items.sum(:total_value)
    end

  end
end
