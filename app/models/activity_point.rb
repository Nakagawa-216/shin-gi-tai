class ActivityPoint < ApplicationRecord
	enum category_id: { 瞑想: 1, ストレッチ: 2, トレーニング: 3 }
	belongs_to :post
	belongs_to :user
end
