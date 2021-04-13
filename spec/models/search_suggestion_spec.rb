require "rails_helper"

RSpec.describe SearchSuggestion, type: :model do
  subject(:search_suggestion) { build(:search_suggestion) }

  describe "associations" do
    it { is_expected.to belong_to(:project) }
  end
end
