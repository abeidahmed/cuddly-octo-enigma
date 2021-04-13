require "rails_helper"

RSpec.describe SearchSuggestion, type: :model do
  subject(:search_suggestion) { build(:search_suggestion) }

  describe "associations" do
    it { is_expected.to belong_to(:project) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:term) }

    it { is_expected.to validate_uniqueness_of(:term).scoped_to(:project_id).case_insensitive }
  end
end
