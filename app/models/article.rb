class Article < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true

  def self.search(query)
    return all if query.blank?

    where("title iLIKE :query", query: "%#{query}%")
  end
end
