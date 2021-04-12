require "rails_helper"

RSpec.describe "users/new.html.erb", type: :view do
  it "has the sign in link" do
    render
    expect(rendered).to have_link("Sign in", href: new_session_path)
  end
end
