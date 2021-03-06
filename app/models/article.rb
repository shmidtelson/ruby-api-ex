class Article < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :content
  validates :slug, uniqueness: true, presence: true

  scope :recent, -> { order(created_at: :desc)}
end
