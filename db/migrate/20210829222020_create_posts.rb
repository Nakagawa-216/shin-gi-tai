class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :activity_point_id
      t.string :image_id
      t.text :body, null: false

      t.timestamps
    end
  end
end
