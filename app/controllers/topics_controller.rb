class TopicsController < ApplicationController
  def new
    @topic = Topic.new
    @random = Randomtitle.offset(rand(Randomtitle.count)).first
  end

  def index
    @topics = Topic.all.includes(:favorite_users)
    #code
  end
  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    topic = Topic.find_by(id: params[:topic_id])

    if topic.destroy
      redirect_to topics_path, success: '投稿を削除しました'
    end
  end

  def hashtag
    @user = current_user
    hash_name = params[:name]
    @topics = Topic.where('description LIKE ?', "%##{hash_name}%")
  end


  private
  def topic_params
    params.require(:topic).permit(:randomtitle_id, :image, :description)
  end
end
