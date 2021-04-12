module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    Current.user = User.find_by(auth_token: cookies.signed[:auth_token]) if cookies[:auth_token]
  end
end
