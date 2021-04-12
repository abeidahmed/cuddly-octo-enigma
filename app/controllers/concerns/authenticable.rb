module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    before_action :authenticate_user
  end

  def set_current_user
    Current.user = User.find_by(auth_token: cookies.signed[:auth_token]) if cookies[:auth_token]
  end

  def authenticate_user
    redirect_to new_session_path, alert: "Please sign in or sign up" unless Current.user
  end
end
