class AddSentInvitationCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sent_invitations_count, :integer
  end
end
