require "rails_helper"

RSpec.describe "ProjectCreates", type: :feature do
  it "redirects to articles new page after creating a project" do
    feature_sign_in
    visit new_project_path
    fill_in "Name", with: "Foo bar"
    click_button "Create project"

    expect(page).to have_current_path(project_articles_path(Project.first))
  end
end
