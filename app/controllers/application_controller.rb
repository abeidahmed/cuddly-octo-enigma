class ApplicationController < ActionController::Base
  include Authenticable
  include SessionsHelper
end
