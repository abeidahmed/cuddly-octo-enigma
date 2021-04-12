require "rails_helper"

RSpec.describe Project, type: :model do
  subject(:project) { build(:project) }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_length_of(:name).is_at_most(255) }
  end
end
