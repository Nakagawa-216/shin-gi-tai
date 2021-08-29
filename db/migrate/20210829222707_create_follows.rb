class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|

      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false

      t.timestamps
    end
  end
end
