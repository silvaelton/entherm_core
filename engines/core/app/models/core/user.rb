module Core
  class User < ActiveRecord::Base

    attr_accessor :password_confirmation

    validates :name, :email, presence: true
    validates :email, email: true, uniqueness: true
    validates :password, :password_confirmation, presence: true, on: :create
    validates :password, :password_confirmation, length: { minimum: 6, maximum: 20 }, if: 'self.password_changed?'

    validate  :password_match?, if: 'self.password_changed?'

    private

    def password_match?
      if self.password != self.password_confirmation
        errors.add(:password, "senha não confere")
      end 
    end

  end
end
