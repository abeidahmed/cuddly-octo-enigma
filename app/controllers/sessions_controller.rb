class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    auth = Authentication.new(params)

    if auth.authenticated?
      sign_in(auth.user)
      redirect_to finders_path
    else
      render json: { errors: { invalid: ["credentials"] } }, status: :unprocessable_entity
    end
  end
end
