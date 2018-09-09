class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [ :login, :verify_token ]

  def login
    info = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response({ status: 'success', user: info[:user], token: info[:token] })
  end

  def verify_token
    info = (VerifyToken.new(params[:token]).call)
    json_response({ status: 'success', user: info[:user], token: params[:token] })
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
