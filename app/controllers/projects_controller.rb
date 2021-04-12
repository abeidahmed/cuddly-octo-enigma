class ProjectsController < ApplicationController
  def new; end

  def create
    project = Current.user.projects.build(project_params)

    if project.save
      # do
    else
      render json: { errors: project.errors }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
