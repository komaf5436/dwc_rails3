class PostImage < ApplicationRecord

  has_one_attached :image

  # PostImageは、Userに属しているという関係からPostImageモデルでは下記のように記述する。
  belongs_to :user
  
  # get_imageメソッドをPostImageモデルの中に記述することで、カラムを呼び出すようにこの処理(メソッド)を呼び出すことが出来る。
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
end
