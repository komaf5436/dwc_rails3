class PostComment < ApplicationRecord
  
  # PostCommentは、User,PostImageに属しているという関係からPostCommentモデルでは下記のように記述する。
  belongs_to :user
  belongs_to :post_image
end
