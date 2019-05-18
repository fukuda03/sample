class Topics_Hashtags < ApplicationRecode
  belongs_to :topic
  belongs_to :Hashtag
  validates :topic_id, presence: true
  varidates :Hashtag_id, presence: true

end
