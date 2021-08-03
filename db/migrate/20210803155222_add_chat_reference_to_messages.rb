class AddChatReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :messages, :chats
    add_index :messages, :chat_id
    change_column_null :messages, :chat_id, false
  end
end
