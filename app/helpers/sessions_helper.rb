module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:auth_token] = user.auth_token
  end

  def user_signed_in?
    Current.user.present?
  end

  def sign_out_user
    cookies.delete(:auth_token) if user_signed_in?
  end
end
