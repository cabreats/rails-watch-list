class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in this list" }
  validates :comment, length: { minimum: 6 }
end
