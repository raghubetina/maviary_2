class AddInvitationCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :invitations_count, :integer
  end
end
