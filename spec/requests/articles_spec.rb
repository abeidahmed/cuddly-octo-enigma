require "rails_helper"

RSpec.describe "Articles", type: :request do
  describe "#create" do
    it "creates a new article if the request is valid" do
      user = create(:user)
      project = create(:project, user: user)
      sign_in(user)
      post project_articles_path(project), params: { article: { title: "Foo bar article" } }

      expect(project.articles.count).to eq(1)
    end
  end
end
