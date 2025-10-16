class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error

  validates :name, :overview, uniqueness: true
end
