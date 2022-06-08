class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # UserモデルとPostImageモデルを関連付けるため下記のように記述する
  # User１つに対して、PostImageを複数個持っているという1:Nの関係になっているので下記のようになる。
  has_many :post_images, dependent: :destroy
end
