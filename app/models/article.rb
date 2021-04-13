class Article < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true

  def self.search(query, belonging_to:)
    return all if query.blank?

    SearchSuggestion.track_term_for(query, belonging_to)
    where("title iLIKE :query", query: "%#{query}%")
  end
end
