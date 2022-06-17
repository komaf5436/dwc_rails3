class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    # PostImageモデルに紐づくデータとして保存する準備をし、フォームに入力されたデータが、@post_imageに格納される
    @post_image = PostImage.new(post_image_params)
    # @post_image.user_idは、この投稿のuser_idとしてcurrent_user.idの値を代入するという意味
    # current_userは、ログイン中のユーザー情報を取得することが出来る。この場合、ログインユーザーのidを取得することが出来る。
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    # コメントを投稿するためのインスタンス定数を
    @post_comment = PostComment.new
  end
  
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  # 投稿データのストロングパラメータ
  private

  # フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェック
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
