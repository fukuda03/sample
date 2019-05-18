class CreateTopicsHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :topics_hashtags, id: false do |t|
      t.references :topic_id, index: true, foreign_key: true
      t.references :hashtag_id, index: true, foreign_key: true
      
    end
  end
end
