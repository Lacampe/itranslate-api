class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_token[:user_id]) if decoded_token
  rescue ActiveRecord::RecordNotFound => error
    raise(ExceptionHandler::InvalidToken, InfoMessage.invalid_token)
  end

  def decoded_token
    @decoded_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
    raise(ExceptionHandler::MissingToken, InfoMessage.missing_token)
  end
end
