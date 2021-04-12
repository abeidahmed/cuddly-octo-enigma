class Article < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :title, presence: true
end
