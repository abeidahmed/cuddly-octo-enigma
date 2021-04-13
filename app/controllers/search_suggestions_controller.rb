class SearchSuggestionsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @search_suggestions = @project.search_suggestions
  end
end
