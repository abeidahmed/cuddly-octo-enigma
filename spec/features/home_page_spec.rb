require "rails_helper"

RSpec.describe "HomePages", type: :feature do
  it "lists all the projects" do
    project = create(:project, name: "My awesome project")
    visit root_path

    expect(page).to have_current_path(root_path)
    expect(page).to have_text(project.name)

    click_link project.name

    expect(page).to have_current_path(project_path(project))
  end
end
