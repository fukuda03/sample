class HashtagsController < ApplicationController
  def new
    @hashtag = Hashtag.new
  end

  def hashtag
    @user = current_user
    hash_name = params[:name]
    @topics = Topic.where('description LIKE ?', "%##{hash_name}%")
  end

end
