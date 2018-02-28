class Idea < ApplicationRecord
  validates :category, presence: true
  validates :text, presence: true

  has_many :idea_pictures
  has_many :pictures, through: :idea_pictures
end
