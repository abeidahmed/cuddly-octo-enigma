class HomeController < ApplicationController
  skip_before_action :authenticate_user

  def index
    @projects = Project.all
  end
end
