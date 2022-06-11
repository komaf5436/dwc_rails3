class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # UserモデルとPostImageモデルを関連付けるため下記のように記述する
  # User１つに対して、PostImageを複数個持っているという1:Nの関係になっているので下記のようになる。
  has_many :post_images, dependent: :destroy

  # 下記の記述により、profile_imageという名前でActiveStorageでプロフィール画像を保存できるよう設定する。
  has_one_attached :profile_image

  # PostImageモデルで記述した内容と変わらないが、下から2行目のコードで画像サイズの変更を行なっている。
  # メソッドに対して引数を設定すれば、設定した値に画像サイズを変換できるようになる。
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width,height]).processed
  end

end
