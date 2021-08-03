class AddReceivedInvitationCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :received_invitations_count, :integer
  end
end
