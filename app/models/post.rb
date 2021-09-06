class Post < ApplicationRecord
    has_many :favorites
    belongs_to :user
    belongs_to :category
    attachment :image
end
