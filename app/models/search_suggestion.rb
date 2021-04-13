class SearchSuggestion < ApplicationRecord
  belongs_to :project

  validates :term, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }

  def self.track_term_for(query, project)
    where(project: project).find_each do |suggestion|
      next if suggestion.term.length >= query.to_s.length

      query.split.map(&:downcase).each do |word|
        suggestion.destroy if suggestion.term.downcase.scan(word).length.positive?
      end
    end

    matching_terms = where("term iLIKE :query", query: "%#{query}%").where(project: project)
    create!(term: query, project: project) if matching_terms.count.zero?
  end
end
