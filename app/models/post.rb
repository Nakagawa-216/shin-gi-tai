class Post < ApplicationRecord
  has_many :favorites
  belongs_to :user
  belongs_to :category
  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
