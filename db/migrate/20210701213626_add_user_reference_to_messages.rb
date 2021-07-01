class AddUserReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :users
    add_index :messages, :user_id
    change_column_null :messages, :user_id, false
  end
end
