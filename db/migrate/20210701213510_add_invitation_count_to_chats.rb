class AddInvitationCountToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :invitations_count, :integer
  end
end
