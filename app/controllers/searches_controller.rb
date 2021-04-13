class SearchesController < ApplicationController
  layout false

  def index
    project = Project.find(params[:project_id])
    @articles = project.articles.search(params[:query], belonging_to: project)
  end
end
