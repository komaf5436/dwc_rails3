class PostImage < ApplicationRecord

  has_one_attached :image

  # PostImageは、Userに属しているという関係からPostImageモデルでは下記のように記述する。
  belongs_to :user
end
