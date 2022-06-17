class PostImage < ApplicationRecord

  has_one_attached :image

  # PostImageは、Userに属しているという関係からPostImageモデルでは下記のように記述する。
  belongs_to :user
  # PostImage１つに対して、PostCommentを複数個持っているという1:Nの関係になっているので下記のようになる。
  has_many :post_comments, dependent: :destroy
  
  # get_imageメソッドをPostImageモデルの中に記述することで、カラムを呼び出すようにこの処理(メソッド)を呼び出すことが出来る。
  # Railsで画像のサイズ変更を行えるよう下記のように書き換える。
  # 画像が設定されていない場合、app/assets/imagesに格納されているno_image.jpgがデフォルト画像としてActiveStorageに格納し、画像を表示される。
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
