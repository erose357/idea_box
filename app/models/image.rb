class Image < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
