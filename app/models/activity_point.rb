class ActivityPoint < ApplicationRecord
	enum category_id: { 瞑想: 1, ストレッチ: 2, トレーニング: 3 }
end
