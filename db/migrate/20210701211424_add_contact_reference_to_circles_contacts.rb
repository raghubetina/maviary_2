class AddContactReferenceToCirclesContacts < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :circles_contacts, :contacts
    add_index :circles_contacts, :contact_id
    change_column_null :circles_contacts, :contact_id, false
  end
end
