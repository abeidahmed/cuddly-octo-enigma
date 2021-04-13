class SearchSuggestion < ApplicationRecord
  belongs_to :project

  validates :term, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }
end
