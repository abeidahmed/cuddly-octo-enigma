require "rails_helper"

RSpec.describe "SignUps", type: :feature do
  it "after signing-up it redirects the user to the new project page" do
    visit new_user_path
    fill_in "Username", with: "johndoe"
    fill_in "Password", with: "helloworld"
    click_button "Create"

    expect(page).to have_current_path(new_project_path)
  end
end
