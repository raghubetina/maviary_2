class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :chat_id
      t.integer :user_id
      t.string :token
      t.integer :clicked
      t.string :rsvp_status

      t.timestamps
    end
  end
end
