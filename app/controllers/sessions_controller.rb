class SessionsController < ApplicationController
  def new; end

  def create
    auth = Authentication.new(params)

    if auth.authenticated?
      cookies.permanent.signed[:auth_token] = auth.user.auth_token
      redirect_to root_path
    else
      render json: { errors: { invalid: ["credentials"] } }, status: :unprocessable_entity
    end
  end
end
