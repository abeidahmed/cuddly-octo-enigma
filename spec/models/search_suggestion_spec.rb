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

  describe "::track_term_for" do
    it "tracks the term" do
      project = create(:project)
      described_class.track_term_for("where", project)

      expect(project.search_suggestions.pluck(:term)).to match_array(%w[where])
    end

    it "tracks the term based on probability of occurence" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "where is my key?")
      described_class.track_term_for("where is my", project)

      expect(project.search_suggestions.pluck(:term)).to match_array(["where is my key?"])
    end

    it "tracks the term based on the previous term" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "Where")
      create(:search_suggestion, project: project, term: "where Is")
      described_class.track_term_for("where is Finland?", project)

      expect(project.search_suggestions.pluck(:term)).to match_array(["where is Finland?"])
    end

    it "tracks inconsistent words and persist the relevant ones" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "How is")
      create(:search_suggestion, project: project, term: "Howis emil hajric")
      described_class.track_term_for("How is emil hajric doing?", project)

      expect(project.search_suggestions.pluck(:term)).to match_array(["How is emil hajric doing?"])
    end
  end
end