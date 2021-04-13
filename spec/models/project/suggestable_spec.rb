require "rails_helper"

RSpec.describe Project::Suggestable do
  describe "track_term_for" do
    it "tracks the term" do
      project = create(:project)
      project.track_term_for("where")

      expect(project.search_suggestions.pluck(:term)).to match_array(%w[where])
    end

    it "tracks the term based on probability of occurence" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "where is my key?")
      project.track_term_for("where is my")

      expect(project.search_suggestions.pluck(:term)).to match_array(["where is my key?"])
    end

    it "tracks the term based on the previous term" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "Where")
      project.track_term_for("where is Finland?")

      expect(project.search_suggestions.pluck(:term)).to match_array(["where is Finland?"])
    end

    it "tracks for inconsistencies and stores the correct query" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "Is it working?")
      create(:search_suggestion, project: project, term: "Howis emil hajric")
      project.track_term_for("How is emil hajric doing?")

      expect(project.search_suggestions.pluck(:term)).to match_array(["How is emil hajric doing?", "Is it working?"])
    end

    it "does not destroy the previous record if there is a change of only one word" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "Is it raining outside?")
      project.track_term_for("Is it raining inside?")

      expect(project.search_suggestions.pluck(:term)).to match_array(
        [
          "Is it raining outside?",
          "Is it raining inside?",
        ],
      )
    end

    it "works if the suggestions are not related" do
      project = create(:project)
      create(:search_suggestion, project: project, term: "tunisia is good")
      project.track_term_for("tunisia is cool but ok")

      expect(project.search_suggestions.pluck(:term)).to match_array(
        [
          "tunisia is good",
          "tunisia is cool but ok",
        ],
      )
    end
  end
end
