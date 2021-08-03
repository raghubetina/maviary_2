class AddRecipientReferenceToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invitations, :users, column: :recipient_id
    add_index :invitations, :recipient_id
    change_column_null :invitations, :recipient_id, false
  end
end
