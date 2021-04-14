class SearchSuggestionsController < ApplicationController
  skip_before_action :authenticate_user

  def index
    @project = Project.find(params[:project_id])
    @search_suggestions = @project.search_suggestions.recent
  end
end
