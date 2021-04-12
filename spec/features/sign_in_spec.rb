require "rails_helper"

RSpec.describe "SignIns", type: :feature do
  it "redirects the user to project index page after successful sign in" do
    feature_sign_in
    expect(page).to have_current_path(finders_path)
  end
end
