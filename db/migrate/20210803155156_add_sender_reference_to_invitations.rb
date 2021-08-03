class AddSenderReferenceToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invitations, :users, column: :sender_id
    add_index :invitations, :sender_id
    change_column_null :invitations, :sender_id, false
  end
end
