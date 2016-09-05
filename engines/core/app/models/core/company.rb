
module Core
  class Company < ActiveRecord::Base
    belongs_to :state

    validates :cnpj, :name, :address, :city, :state_id, presence: true
    validates :cnpj, cnpj: true
  end
end
