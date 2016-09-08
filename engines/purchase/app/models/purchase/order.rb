module Purchase
  class Order < ActiveRecord::Base
    belongs_to :contract, class_name: "Core::Contract"
    belongs_to :category, class_name: "Purchase::OrderCategory"
    belongs_to :supplier

    has_many :order_items
      
    default_scope { order('created_at DESC') }
    scope :by_contract, -> (value) { where(contract_id: value)}
    scope :by_period,   -> started_at, ended_at { where(created_at: started_at..ended_at) }
    scope :by_status,   -> status { where(status: status) }
    scope :by_id,       -> id     { where(id: id) }
    
    enum purchase_type: ['orçamento','compra']
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

  end
end
