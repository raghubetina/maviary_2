class AddUserReferenceToInvitations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :invitations, :users
    add_index :invitations, :user_id
    change_column_null :invitations, :user_id, false
  end
end
