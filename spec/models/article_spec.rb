require "rails_helper"

RSpec.describe Article, type: :model do
  subject(:article) { build(:article) }

  describe "associations" do
    it { is_expected.to belong_to(:project) }

    it { is_expected.to belong_to(:user) }
  end
end
