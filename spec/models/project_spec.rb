require "rails_helper"

RSpec.describe Project, type: :model do
  subject(:project) { build(:project) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
