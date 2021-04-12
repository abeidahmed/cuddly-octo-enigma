require "rails_helper"

RSpec.describe "ArticleCreates", type: :feature do
  it "redirects to the same page after creating" do
    user = create(:user)
    project = create(:project, user: user)
    feature_sign_in(user)
    visit project_articles_path(project)
    fill_in "Title", with: "Foo many times"
    click_button "Create article"

    expect(page).to have_text("Foo many times")
    expect(page).to have_current_path(project_articles_path(project))
  end
end
