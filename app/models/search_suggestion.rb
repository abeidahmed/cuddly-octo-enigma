class SearchSuggestion < ApplicationRecord
  belongs_to :project

  validates :term, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }

  def self.track_term_for(query, project)
    existing_terms = where(project: project).pluck(:term)
    existing_terms.each do |term|
      where(term: existing_terms).destroy_all if query.downcase.include?(term.downcase)
    end

    matching_terms = where("term iLIKE :query", query: "%#{query}%").where(project: project)
    create!(term: query, project: project) if matching_terms.count.zero?
  end
end
