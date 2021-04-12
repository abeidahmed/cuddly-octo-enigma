require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "#create" do
    it "creates the project if request is valid" do
      user = create(:user)
      sign_in(user)
      post projects_path, params: { project: { name: "Demo project" } }

      expect(user.projects.count).to eq(1)
    end

    it "returns error if project request is invalid" do
      user = create(:user)
      sign_in(user)
      post projects_path, params: { project: { name: "" } }

      expect(json.dig(:errors, :name)).to be_present
    end
  end
end
