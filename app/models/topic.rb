class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :randomtitle
  has_many :comments
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  mount_uploader :image, ImageUploader

  after_create do
    topic = Topic.find_by(id: self.id)
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      topic.hashtags << tag
    end
  end

  before_update do
    topic = Topic.find_by(id: self.id)
    topic.hashtags.clear
    hashtags = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.topic do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      topic.hashtags << tag
    end
  end

end
