module Authentication
  class ClientAuthentication
    prepend SimpleCommand

    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      user = get_user()
      JsonWebToken.encode(user_id: user.id) if user
    end

    private
    attr_accessor :email, :password

    def get_user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)
      errors.add(:user_authentication, 'invalid credentials')
      nil
    end
  end
end