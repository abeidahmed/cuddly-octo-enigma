class ArticlesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  end

  def create
    project = Project.find(params[:project_id])
    article = project.articles.build(article_params.merge({ user: Current.user }))

    if article.save
      redirect_to project_articles_path(project)
    else
      render json: { errors: article.errors }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
