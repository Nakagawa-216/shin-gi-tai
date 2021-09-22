class RemoveActivityPointFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :activity_point, :integer
  end
end
