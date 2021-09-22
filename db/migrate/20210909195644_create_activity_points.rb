class CreateActivityPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_points do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :post_id, null: false
      t.integer :activity_point, default: 0
      
      t.timestamps
    end
  end
end
