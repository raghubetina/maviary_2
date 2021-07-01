class AddCreatorReferenceToChats < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :chats, :users, column: :creator_id
    add_index :chats, :creator_id
    change_column_null :chats, :creator_id, false
  end
end
