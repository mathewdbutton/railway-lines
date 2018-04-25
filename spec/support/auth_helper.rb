module AuthHelper

  def login_user(user)
    JsonWebToken.encode({user_id: user.id})
  end
end