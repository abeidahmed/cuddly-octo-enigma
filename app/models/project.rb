class Project < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_many :search_suggestions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
end
