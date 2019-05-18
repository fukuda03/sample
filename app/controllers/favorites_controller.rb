class FavoritesController < ApplicationController
  def new
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'いいねしました'
    else
      redirect_to topics_path, danger: 'いいね失敗'

    end
  end

  def destroy
    favorite = Favorite.find_by(topic_id: params[:topic_id])

    if favorite.destroy
      redirect_to topics_path, success: 'いいね削除'
    else
      redirect_to topics_path, danger: 'いいね削除失敗'
    end
  end

end
