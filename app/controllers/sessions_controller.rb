class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new; end

  def create
    auth = Authentication.new(params)

    if auth.authenticated?
      sign_in(auth.user)
      redirect_to new_project_path
    else
      render json: { errors: { invalid: ["credentials"] } }, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out_user
    redirect_to new_session_path
  end
end
