class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # 下記のように記述することで、特定のユーザ(@user)に関連付けられた投稿全て(.post_images)を取得し@post_imagesに渡すという処理を行う。
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end
end
