class Authentication
  attr_reader :password, :username

  def initialize(params)
    @username = params[:username].to_s.downcase
    @password = params[:password]
  end

  def authenticated?
    user.present?
  end

  def user
    @user ||= User.find_by(username: username)
    return unless @user

    @user.authenticate(password) ? @user : nil
  end
end
