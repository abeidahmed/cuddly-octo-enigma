class SearchesController < ApplicationController
  layout false

  def index
    project = Project.find(params[:project_id])
    @articles = project.articles.search(params[:query])
    project.track_term_for(params[:query])
  end
end
