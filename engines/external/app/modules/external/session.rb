module External
  class Session
    include ActiveModel::Model

    attr_accessor :id, :email, :password

    validates :email, email: true, presence: true
    validates :password, presence: true

    validate :valid_credential?

    private

    def valid_credential?
      credential = Core::Requester.where(email: self.email, password: self.password)
      
      if credential.present?
        self.id = credential.first.id
      else
        errors.add(:email, "E-mail ou Senha não conferem")
      end
    end
  end
end