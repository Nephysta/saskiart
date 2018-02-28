class Idea < ApplicationRecord
  validates :category, presence: true
  validates :text, presence: true
end
