class Picture < ApplicationRecord
  validates :data, presence: true

  has_many :idea_pictures
  has_many :ideas, through: :idea_pictures
end
