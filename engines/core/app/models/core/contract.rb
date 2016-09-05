module Core
  class Contract < ActiveRecord::Base
    belongs_to :company
  
    default_scope {order(:name)}    
    validates :name,  presence: true
  end
end
