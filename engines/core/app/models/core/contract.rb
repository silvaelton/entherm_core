module Core
  class Contract < ActiveRecord::Base
    belongs_to :company
    
    validates :name,  presence: true
  end
end
