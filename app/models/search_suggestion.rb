class SearchSuggestion < ApplicationRecord
  belongs_to :project

  validates :term, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }

  def self.track_term_for(query, project)
    previous_suggestion = where(project: project).last
    previous_suggestion.destroy if previous_suggestion && deletable?(previous_suggestion.term, by: query)

    matching_terms = where("term iLIKE :query", query: "%#{query}%").where(project: project)
    create!(term: query, project: project) if matching_terms.count.zero?
  end

  def self.deletable?(string, by:) # rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
    arr = []
    by.split.map(&:downcase).each do |word|
      arr << string.downcase.scan(word)
    end
    arr = arr.flatten.map(&:downcase)

    return false if string.length == by.length

    if string.length > by.length
      string.split.map(&:downcase).all? { |ele| arr.include?(ele.downcase) }
    else
      arr.all? { |ele| by.split.map(&:downcase).include?(ele) }
    end
  end
end
