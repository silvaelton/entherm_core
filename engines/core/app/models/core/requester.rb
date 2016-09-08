module Core
  class Requester < ActiveRecord::Base
    belongs_to :contracts, class_name: "Core::Contract"
    has_many   :requests, class_name: "Purchase::Request", primary_key: 'requester_id'

    default_scope { order('created_at DESC') }
    
    attr_accessor :password_confirmation
    
    enum status: [:pendente, :processando, :cancelado, :atendido]

    validates :name, :email, presence: true
    validates :email, email: true, uniqueness: true
    validates :password, :password_confirmation, presence: true, on: :create
    validates :password, :password_confirmation, length: { minimum: 6, maximum: 20 }, if: 'self.password_changed?'

    validate  :password_match?, if: 'self.password_changed?'

    def contract_ids
      Core::Contract.where(id: self.contracts_id)
    end

    private

    def password_match?
      if self.password != self.password_confirmation
        errors.add(:password, "senha não confere")
      end 
    end
  end
end
