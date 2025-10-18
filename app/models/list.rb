class List < ApplicationRecord
  attr_accessor :image_url

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  validates :name, uniqueness: true
  validates :name, presence: true

  has_one_attached :image

  before_save :attach_image_from_url, if: -> { image_url.present? && !image.attached? }

  private

  require 'open-uri'

  def attach_image_from_url
    downloaded_image = URI.open(image_url)
    self.image.attach(io: downloaded_image, filename: File.basename(URI.parse(image_url).path))
  rescue => e
    errors.add(:image, "could not be downloaded from the URL")
  end
end
