class ArticlesController < ApplicationController
  def new; end

  def create
    project = Project.find(params[:project_id])
    article = project.articles.build(article_params.merge({ user: Current.user }))

    if article.save
      # do
    else
      render json: { errors: article.errors }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title)
  end
end
