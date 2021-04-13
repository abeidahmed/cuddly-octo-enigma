class SearchSuggestion < ApplicationRecord
  belongs_to :project

  validates :term, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }

  scope :recent, -> { order(created_at: :desc) }
end
