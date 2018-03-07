class Picture < ApplicationRecord
  validates :data, presence: true

  has_many :idea_pictures
  has_many :ideas, through: :idea_pictures

  def self.with_ideas(ids)
    joins(:idea_pictures).where(idea_pictures: { idea_id: ids })
  end
end
