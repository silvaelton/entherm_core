module Purchase
  class Supplier < ActiveRecord::Base
    belongs_to :state, class_name: "Core::State"
    belongs_to :category, primary_key: 'id', foreign_key: 'category_id', class_name: "Purchase::SupplierCategory"

    scope :by_name, -> (name) { where("name ILIKE '%#{name}%'")}

    #validates :name, :state, presence: true
  end
end
