class AddChatReferenceToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invitations, :chats
    add_index :invitations, :chat_id
    change_column_null :invitations, :chat_id, false
  end
end
