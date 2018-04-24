class Picture < ApplicationRecord
  validates :data, presence: true
  validate :data_must_be_a_base64_encoded_string

  has_many :idea_pictures
  has_many :ideas, through: :idea_pictures

  def data_must_be_a_base64_encoded_string
    unless /^data:image\/[a-z]*;base64,[a-zA-Z0-9\/+]*={0,2}$/.match(data)
      errors.add(:data, 'Need a base64 encoded string!')
    end
  end

  def self.with_ideas(ids)
    joins(:idea_pictures).where(idea_pictures: { idea_id: ids })
  end

  def theme
    Theme.new(picture: self)
  end
end
