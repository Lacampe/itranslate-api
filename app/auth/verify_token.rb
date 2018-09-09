class VerifyToken
  def initialize(token)
    @token = token
  end

  def call
    { user: user }
  end

  private

  attr_reader :token

  def user
    @user ||= User.find(decoded_token[:user_id])
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(token)
  end
end
