class JsonWebToken
  HMAC_SECRET = Rails.application.credentials.secret_key_base
  ALGORITHM   = 'HS256'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp]
    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET, true, algorithm: ALGORITHM)[0]
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError => error
    raise(ExceptionHandler::InvalidToken, Message.invalid_token)
  end
end
