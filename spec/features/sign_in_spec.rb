require "rails_helper"

RSpec.describe "SignIns", type: :feature do
  it "redirects the user to root_path after successful sign in" do
    feature_sign_in
    expect(page).to have_current_path(root_path)
  end
end
