class Randomtitle < ApplicationRecord
  validates :title, presence: true

  has_many :topics
end
