class AddCircleCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :circles_count, :integer
  end
end
