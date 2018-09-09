class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def index
    json_response(User.serialize_all)
  end

  def create
    user = User.new(user_params)
    if user.save
      token    = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, token: token }
      json_response(response, :created)
    else
      json_response({ errors: user.errors }, :bad_request)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
