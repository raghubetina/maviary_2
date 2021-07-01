class AddCreatedChatCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :created_chats_count, :integer
  end
end
