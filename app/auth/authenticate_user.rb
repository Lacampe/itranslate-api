class AuthenticateUser
  def initialize(email, password)
    @email    = email
    @password = password
  end

  def call
    token = JsonWebToken.encode(user_id: user.id)
    { user: user, token: token }
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
