class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sessions_new_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def show
    @user = current_user
    #code
  end

  def edit
    @user = current_user
  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました。'
      render users_edit_path
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render users_edit_path
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
