class AddUserReferenceToCircles < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :circles, :users
    add_index :circles, :user_id
    change_column_null :circles, :user_id, false
  end
end
