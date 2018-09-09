module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class ExpiredSignature < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid,            with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError,  with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken,         with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken,         with: :four_twenty_two
    rescue_from ExceptionHandler::ExpiredSignature,     with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |error|
      json_response({ error: error.message }, :not_found)
    end
  end

  private

  def four_twenty_two(error)
    json_response({ status: 'error', error: error.message }, :unprocessable_entity)
  end

  def unauthorized_request(error)
    json_response({ status: 'error', error: error.message }, :unauthorized)
  end
end
