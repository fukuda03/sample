class AddRandomTitleIdToTopics < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics,  :randomtitle, foreign_kye: true
  end
end
