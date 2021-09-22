class Post < ApplicationRecord
  has_many :favorites
  has_many :post_comments, dependent: :destroy
  has_many :activity_point, dependent: :destroy
  belongs_to :user
  belongs_to :category
  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
