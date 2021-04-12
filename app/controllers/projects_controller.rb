class ProjectsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[show]

  def new
    @project = Project.new
  end

  def create
    project = Current.user.projects.build(project_params)

    if project.save
      redirect_to project_articles_path(project)
    else
      render json: { errors: project.errors }, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
