class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :idea_images
  has_many :images, through: :idea_images

  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
end
